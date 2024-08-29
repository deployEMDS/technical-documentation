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
    results = extract_test_results(Path(base_dir))
    filtered_results = _filter_result_data(results)
    sorted_results = sorted(filtered_results, key=lambda x: x['test_id'])
    prepared_results = _prepare_result_data(sorted_results, github_base_url)
    render_markdown_table(prepared_results, output_file)
    click.echo(f"Markdown table has been generated and saved to {output_file}")


def extract_test_results(base_path):
    """Extract test results from the given base directory."""
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

                    result = process_test_file(test_md_path, base_path, test_id)
                    if result:
                        results.append(result)

    return results


def process_test_file(test_md_path, base_path, test_id):
    """Process an individual test.md file and extract relevant data."""
    with open(test_md_path, 'r') as f:
        test_content = f.read()

    title_parts = test_content.split('\n')[1].strip('## ').split(' ')
    title = ' '.join(title_parts[1:])
    test_id_numeric = title_parts[0]

    description = extract_description(test_content)
    phase = extract_phase(test_content)
    minimal = 'Yes' if 'Minimal?\nYes' in test_content else 'No'

    result_files = list(test_id.glob('result_*.md'))
    result_edc = find_score_in_results(result_files, 'edc')
    result_fiware = find_score_in_results(result_files, 'fiware')
    relative_path = test_id.relative_to(base_path)
    original_string = str(relative_path)
    base_path, version_numbers = original_string.rsplit('/test_', 1)
    formatted_version = version_numbers.replace('_', '.')
    modified_relative_path = f"{base_path}/{formatted_version}"
    customer_journey = format_path(modified_relative_path)
    return {
        'test_id': test_id_numeric,
        'title': title,
        'description': description,
        'path': modified_relative_path,
        'result_files': result_files,
        'customer_journey': customer_journey,
        'phase': phase,
        'minimal': minimal,
        'result_edc': result_edc,
        'result_fiware': result_fiware,
    }


def format_path(path):
    path_str = str(path)
    path_str = path_str.lstrip('./')
    path_str = re.split(r'/\d+\.\d+\.\d+\.\d+$', path_str)[0]  # Remove the trailing version part
    path_str = path_str.replace('_', ' ')
    path_str = path_str.title()
    path_str = path_str.replace('/', ' - ')
    return path_str

def extract_description(test_content):
    """Extract test description from the test content."""
    pattern = re.compile(r"### Test description\s*(.*?)(?=\n###|$)", re.DOTALL)
    match = pattern.search(test_content)
    description = match.group(1).strip() if match else 'N/A'
    return description.replace('\n', '<br />')


def extract_phase(test_content):
    """Extract the phase number from the test content."""
    phase_match = re.search(r'Phase (\d+)', test_content)
    return phase_match.group(1) if phase_match else 'N/A'


def find_score_in_results(result_files, keyword):
    """Find score in the result files based on a keyword."""
    score_pattern = re.compile(r"Metric(?: Score)?:\s*(\d+(\.\d+)?)", re.IGNORECASE)
    for result_file in result_files:
        if keyword in str(result_file):
            with open(result_file, 'r') as f:
                content = f.read()
            match = score_pattern.search(content)
            return match.group(1) if match else 'N/A'
    return 'N/A'


def _filter_result_data(results):
    """Filter results to include only those that are minimal and in phase 1 or 2."""
    return [r for r in results if (r['minimal'] == 'Yes' and r['phase'] in ['1', '2'])]


def _prepare_result_data(results, github_base_url):
    """Prepare result data for rendering in the Markdown table."""
    prepared_results = []
    for result in results:
        test_link = f"./{result['path']}"
        result_links = [
            {
                'name': f.stem.replace('result_', ''),
                'url': f"{github_base_url}/{result['path']}/{f.name}",
            }
            for f in result['result_files']
        ]

        prepared_results.append({
            'test_id': result['test_id'],
            'test_link': test_link,
            'test_title': result['title'],
            'description': result['description'],
            'phase': result['phase'],
            'customer_journey': result['customer_journey'],
            'minimal': result['minimal'],
            'result_links': result_links,
            'result_edc': result['result_edc'],
            'result_fiware': result['result_fiware'],
        })

    return prepared_results


def render_markdown_table(prepared_results, output_file):
    """Render the Markdown table using the Jinja2 template."""
    template_data = {'results': prepared_results}
    markdown_table = template_env.get_template('score_matrix.jinja2').render(**template_data)

    with open(output_file, 'w') as f:
        f.write(markdown_table)


if __name__ == '__main__':
    generate_test_results_table()
