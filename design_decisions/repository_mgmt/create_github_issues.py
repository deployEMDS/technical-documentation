import os
import warnings

import click
import pandas as pd
from dotenv import load_dotenv
from github import Github
from jinja2 import Environment, FileSystemLoader

# Default configurations
DEFAULT_EXCEL_FILE = '../background_info/testing_backlog.xlsm'
DEFAULT_SHEET_NAME = 'List of tests'
DEFAULT_PHASES = [1, 2, 3]
DEFAULT_STACKS = ['EDC+VC', 'Fiware']

# Set up Jinja2 environment
template_env = Environment(loader=FileSystemLoader('templates'))

load_dotenv()


@click.command()
@click.option('--excel-file', default=DEFAULT_EXCEL_FILE, help='The Excel file with the test backlog.', show_default=True, type=click.Path(exists=True))
@click.option('--sheet-name', default=DEFAULT_SHEET_NAME, help='The name of the sheet in the Excel file.', show_default=True, type=str)
@click.option('--stack', 'stacks', default=DEFAULT_STACKS, help='The stack(s) to create issues for.', show_default=True, multiple=True, type=str)
@click.option('--phase', 'phases', default=DEFAULT_PHASES, help='The phase(s) to create issues for.', show_default=True, multiple=True, type=int)
@click.option('--only-minimal', is_flag=True, help='Only create issues for minimal tests.', show_default=True, type=bool)
def create_github_issues(excel_file, sheet_name, stacks, phases, only_minimal):
    github_token = os.getenv('GITHUB_TOKEN')
    github_repo_name = os.getenv('GITHUB_REPO_NAME')
    github_enterprise_url = os.getenv('GITHUB_ENTERPRISE_URL')

    if not all([github_token, github_repo_name, github_enterprise_url]):
        click.echo('Please set the GITHUB_TOKEN, GITHUB_REPO_NAME, and GITHUB_ENTERPRISE_URL environment variables.', err=True, color='red')
        return

    # Read the Excel file
    with warnings.catch_warnings():
        warnings.filterwarnings("ignore", category=UserWarning)
        df = pd.read_excel(excel_file, sheet_name=sheet_name)

    # Initialize GitHub client for Enterprise
    if github_enterprise_url and github_enterprise_url != 'https://github.com':
        g = Github(base_url=github_enterprise_url, login_or_token=github_token)
    else:
        g = Github(login_or_token=github_token)
    repo = g.get_repo(github_repo_name)

    milestones = get_or_create_milestones(repo, df)

    existing_issues = repo.get_issues(state='open')
    existing_issue_titles = {issue.title for issue in existing_issues}

    issue_template = template_env.get_template('issue.jinja2')

    for index, row in df.iterrows():
        for stack in stacks:
            process_test(repo, row, stack, phases, milestones, existing_issue_titles, only_minimal, issue_template)

    click.echo("Issue creation process completed.")


def get_or_create_milestones(repo, df):
    unique_phases = df['Execution phase'].unique()
    milestones = {}
    existing_milestones = repo.get_milestones()
    milestones_by_title = {milestone.title: milestone for milestone in existing_milestones}

    for phase in sorted(list(unique_phases)):
        if pd.notna(phase):
            if f"Phase {int(phase)}" in milestones_by_title:
                milestones[phase] = milestones_by_title[f"Phase {int(phase)}"]
            else:
                milestones[phase] = repo.create_milestone(title=f"Phase {int(phase)}")
    return milestones


def process_test(repo, row, stack, phases, milestones, existing_issue_titles, only_minimal, issue_template):
    test_id = row['Test ID']
    execution_phase = row['Execution phase']
    minimal = row['Minimal?'] >= 1
    title = f"Test {test_id} [{stack}]"

    if execution_phase not in phases:
        # click.echo(f"Skipping test {test_id} as it is not in the phases to be executed. {execution_phase} / {phases}.")
        return
    if not minimal and only_minimal:
        # click.echo(f"Skipping test {test_id} as it is not minimal and `only_minimal` is True.")
        return
    if not row['Testable'] or str(row['Testable']).upper() == 'FALSE' or pd.isna(row['Testable']):
        click.echo(f"Skipping test {test_id} as it is not testable.")
        return
    if pd.isna(row['Test description']):
        click.echo(f"Skipping test {test_id} as it has no description.")
        return
    if title in existing_issue_titles:
        click.echo(f"Skipping test {test_id} for stack {stack} as the issue already exists.")
        return

    body = issue_template.render(
        title=title,
        business_capability=row['Business capability'],
        customer_journey=row['Customer journey'],
        customer_sub_journey=row['Customer sub-journey'],
        test_description=row['Test description'],
        test_type=row['Test type'],
        execution_phase=execution_phase,
        minimal=minimal,
        iso25010_quality=row['ISO25010 Quality'],
        iso25010_quality_description=row['ISO25010 Quality description']
    )

    labels = [
        f"bc:{row['Business capability'].lower().strip()}",
        f"cj:{row['Customer journey'].lower().strip()}",
        f"csj:{row['Customer sub-journey'].lower().strip()}",
        f"tf:{stack.lower().strip()}"
    ]
    if minimal:
        labels.append('minimal')

    milestone = milestones.get(execution_phase)

    issue = repo.create_issue(
        title=title,
        body=body,
        labels=labels,
        assignees=[],
        milestone=milestone
    )
    click.echo(f"Created issue: {issue.number} - {stack} {issue.title}")


if __name__ == '__main__':
    create_github_issues()
