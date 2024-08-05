import os
import re
import warnings

import click
import pandas as pd
from dotenv import load_dotenv
from jinja2 import Environment, FileSystemLoader

# Default configurations
DEFAULT_EXCEL_FILE = '../background_info/testing_backlog.xlsm'
DEFAULT_SHEET_NAME = 'List of tests'
DEFAULT_STACKS = ['EDC+VC', 'Fiware']

# Set up Jinja2 environment
template_env = Environment(loader=FileSystemLoader('templates'))

load_dotenv()


@click.command()
@click.option('--excel-file', default=DEFAULT_EXCEL_FILE, help='The Excel file with the test backlog.', show_default=True, type=click.Path(exists=True))
@click.option('--sheet-name', default=DEFAULT_SHEET_NAME, help='The name of the sheet in the Excel file.', show_default=True, type=str)
@click.option('--base-dir', required=True, type=click.Path(), help='Base directory for test files')
@click.option('--stack', 'stacks', default=DEFAULT_STACKS, multiple=True, help='List of stacks to process', show_default=True)
def create_repo_structure(excel_file, sheet_name, base_dir, stacks):
    """Create test and result files from Excel data."""
    # Read the Excel file
    with warnings.catch_warnings():
        warnings.filterwarnings("ignore", category=UserWarning)
        df = pd.read_excel(excel_file, sheet_name=sheet_name)

    for _, row in df.iterrows():
        _process_test(row, base_dir, stacks)

    click.echo("Directory structure and files created successfully.")


def _sanitize_filename(name):
    """Convert a string to a valid filename."""
    return re.sub(r'(\s|\u180B|\u200B|\u200C|\u200D|\u2060|\uFEFF|/|\.)+', '_', str(name)).lower()


def _create_directory(path):
    """Create a directory if it doesn't exist."""
    os.makedirs(path, exist_ok=True)


def _create_test_md(path, row):
    """Create test.md file with test description."""
    template = template_env.get_template('test.md')
    content = template.render(
        title=f"[{row['Test ID']}] {row['Business capability']}: {row['Customer journey']} - {row['Customer sub-journey']}",
        test_description=row['Test description'],
        test_type=row['Test type'],
        execution_phase=row['Execution phase'],
        minimal="Yes" if row['Minimal?'] >= 1 else "No",
        iso25010_quality=row['ISO25010 Quality'],
        iso25010_quality_description=row['ISO25010 Quality description']
    )
    with open(os.path.join(path, 'test.md'), 'w') as f:
        f.write(content)


def _create_gitkeep(path):
    """Create .gitkeep file in the directory."""
    open(os.path.join(path, '.gitkeep'), 'w').close()


def _create_result_md(path, row, stack):
    """Create result markdown files with template."""
    template = template_env.get_template('result.md')
    content = template.render(
        title=f"[{row['Test ID']}] {row['Business capability']}: {row['Customer journey']} - {row['Customer sub-journey']}",
        stack=stack
    )
    stack_filename = re.sub(r'\+|\s', '_', stack.lower())
    with open(os.path.join(path, f'result_{stack_filename}.md'), 'w') as f:
        f.write(content)


def _process_test(row, base_dir, stacks):
    """Process a single row of data and create necessary files and directories."""
    business_capability = _sanitize_filename(row['Business capability'])
    customer_journey = _sanitize_filename(row['Customer journey'])
    customer_sub_journey = _sanitize_filename(row['Customer sub-journey'])
    test_id = _sanitize_filename(f"test_{row['Test ID']}")

    path = os.path.join(base_dir, business_capability, customer_journey, customer_sub_journey, test_id)
    _create_directory(path)

    _create_test_md(path, row)
    _create_gitkeep(path)

    for stack in stacks:
        _create_result_md(path, row, stack)

    click.echo(f"Created files for test {row['Test ID']}")


if __name__ == '__main__':
    create_repo_structure()
