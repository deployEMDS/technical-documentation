import shutil
from pathlib import Path

import click
from dotenv import load_dotenv
from jinja2 import Environment, FileSystemLoader

import util

# Set up Jinja2 environment
template_env = Environment(loader=FileSystemLoader('templates'))

load_dotenv()


@click.command()
@click.option('--input-dir', '-i', required=True, type=click.Path(exists=True), help='Base directory containing test files')
@click.option('--output-dir', '-o', required=True, type=click.Path(exists=True), help='Output directory for the docusaurus content')
@click.option('--github-base-url', required=True, help='Base URL for GitHub repository')
def generate_test_results_table(input_dir, output_dir, github_base_url):
    """Generate a Markdown table linking to test results."""
    base_path = Path(input_dir)
    test_result_template = template_env.get_template('result_page.jinja2')

    for business_capability in base_path.iterdir():
        if not business_capability.is_dir():
            continue
        business_capability_dir = business_capability.name
        business_capability_name = business_capability.name.replace('_', ' ').capitalize()

        for customer_journey in business_capability.iterdir():
            if not customer_journey.is_dir():
                continue
            customer_journey_dir = customer_journey.name
            customer_journey_name = customer_journey.name.replace('_', ' ').capitalize()

            for customer_sub_journey in customer_journey.iterdir():
                if not customer_sub_journey.is_dir():
                    continue
                customer_sub_journey_dir = customer_sub_journey.name
                customer_sub_journey_name = customer_sub_journey.name.replace('_', ' ').capitalize()

                docs_path = Path(output_dir) / business_capability_dir / customer_journey_dir / customer_sub_journey_dir
                docs_path.mkdir(parents=True, exist_ok=True)


                csj_tests = []

                for test_id in customer_sub_journey.iterdir():
                    if not test_id.is_dir():
                        continue

                    test_md_path = test_id / 'test.md'
                    if not test_md_path.exists():
                        continue

                    # Extract test information
                    test_info: util.TestInformation = util.read_test_info(test_md_path, github_base_url)
                    test_info.tags = [business_capability_name, customer_journey_name, customer_sub_journey_name]

                    # Find result files and check if they're done
                    result_files = list(test_id.glob('result_*.md'))
                    test_results = []
                    for result_file in result_files:
                        test_results.append(util.read_test_result(result_file, github_base_url))

                    csj_tests.append(
                        util.TestResults(
                            information=test_info,
                            at_least_one_done=any([r.is_done for r in test_results]),
                            results=test_results,
                            num_results=len(test_results),
                            num_results_done=len([r for r in test_results if r.is_done]),
                        )
                    )
                    csj_tests = sorted(csj_tests, key=lambda x: x.id)

                    # Create relative path for linking
                    relative_path = test_id.relative_to(base_path)

                    for test in csj_tests:
                        result_path = docs_path / f"{test.id}.mdx"
                        with open(result_path, 'w') as f:
                            f.write(test_result_template.render(
                                test=test,
                                github_base_url=github_base_url,
                                relative_path=relative_path,
                            ))

                    static_dirs = list(test_id.glob('static')) + list(test_id.glob('images/')) + list(test_id.glob('image/'))
                    for static_dir in static_dirs:
                        target_dir = docs_path / static_dir.name
                        target_dir.mkdir(exist_ok=True)
                        for static_file in static_dir.iterdir():
                            shutil.copy2(static_file, target_dir / static_file.name)


if __name__ == '__main__':
    generate_test_results_table()
