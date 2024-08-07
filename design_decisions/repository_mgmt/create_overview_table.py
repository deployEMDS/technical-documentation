import re
from pathlib import Path

import click
from dotenv import load_dotenv
from jinja2 import Environment, FileSystemLoader

# Set up Jinja2 environment
template_env = Environment(loader=FileSystemLoader('templates'))

load_dotenv()


@click.command()
@click.option('--base-dir', required=True, type=click.Path(exists=True), help='Base directory containing test files')
@click.option('--output-file', required=True, type=click.Path(), help='Output file for the generated Markdown table')
@click.option('--github-base-url', required=True, help='Base URL for GitHub repository')
def generate_test_results_table(base_dir, output_file, github_base_url):
    """Generate a Markdown table linking to test results."""
    base_path = Path(base_dir)
    results = []

    for business_capability in base_path.iterdir():
        if not business_capability.is_dir():
            continue
        for customer_journey in business_capability.iterdir():
            if not customer_journey.is_dir():
                continue
            for customer_sub_journey in customer_journey.iterdir():
                if not customer_sub_journey.is_dir():
                    continue
                for test_id in customer_sub_journey.iterdir():
                    if not test_id.is_dir():
                        continue

                    test_md_path = test_id / 'test.md'
                    if not test_md_path.exists():
                        continue

                    # Extract test information
                    with open(test_md_path, 'r') as f:
                        test_content = f.read()
                        title_parts = test_content.split('\n')[1].strip('## ').split(' ')
                        title = ' '.join(title_parts[1:])
                        test_id_numeric = title_parts[0]
                        phase = re.search(r'Phase (\d+)', test_content)
                        phase = phase.group(1) if phase else 'N/A'
                        minimal = 'Yes' if 'Minimal?\nYes' in test_content else 'No'

                    # Find result files and check if they're done
                    result_files = list(test_id.glob('result_*.md'))
                    result_statuses = {f.stem.replace('result_', ''): _is_result_file_done(f) for f in result_files}
                    minimal = 'Yes' if any(result_statuses.values()) else minimal

                    # Create relative path for linking
                    relative_path = test_id.relative_to(base_path)

                    results.append({
                        'test_id': test_id_numeric,
                        'title': title,
                        'path': relative_path,
                        'result_files': result_files,
                        'result_statuses': result_statuses,
                        'phase': phase,
                        'minimal': minimal
                    })

    # Filter and sort results
    filtered_results = _filter_result_data(results)
    sorted_results = sorted(filtered_results, key=lambda x: x['test_id'])
    prepared_results = _prepare_result_data(sorted_results, github_base_url)

    template_data = {
        'results': prepared_results
    }

    # Render table template
    markdown_table = template_env.get_template('overview.jinja2').render(**template_data)

    # Write table to output file
    with open(output_file, 'w') as f:
        f.write(markdown_table)

    click.echo(f"Markdown table has been generated and saved to {output_file}")


def _filter_result_data(results):
    return [r for r in results if r['minimal'] == 'Yes' and r['phase'] in ['1', '2']]


def _prepare_result_data(results, github_base_url):
    prepared_results = []
    for result in results:
        test_link = f"[{result['title']}]({github_base_url}/{result['path']}/test.md)"
        result_links = []
        for f in result['result_files']:
            file_name = f.stem.replace('result_', '')
            file_url = f"{github_base_url}/{result['path']}/{f.name}"
            status = '✅' if result['result_statuses'][file_name] else '❌'
            result_links.append({
                'name': file_name,
                'url': file_url,
                'status': status
            })

        prepared_results.append({
            'test_id': result['test_id'],
            'test_link': test_link,
            'phase': result['phase'],
            'minimal': result['minimal'],
            'result_links': result_links
        })

    return prepared_results


def _is_result_file_done(file_path):
    """Check if a result file is done by counting TODO entries."""
    with open(file_path, 'r') as f:
        content = f.read()
        todo_count = content.count('[TODO]')
        return todo_count <= 6  # Consider done if 6 or fewer TODOs remain


if __name__ == '__main__':
    generate_test_results_table()
