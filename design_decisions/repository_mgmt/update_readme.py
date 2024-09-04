import re
from datetime import datetime, timezone

import click


@click.command()
@click.option('--readme-path', default='../../README.md', help='Path to the README file')
@click.option('--overview-path', default='overview.tmp.md', help='Path to the overview file')
@click.option('--start-marker', default='<!-- START_TEST_RESULTS_TABLE -->', help='Start marker for the table section')
@click.option('--end-marker', default='<!-- END_TEST_RESULTS_TABLE -->', help='End marker for the table section')
@click.option('--timestamp-format', default='%Y-%m-%d %H:%M:%S UTC', help='Format for the timestamp')
@click.option('--timestamp-prefix', default='Last updated: ', help='Prefix for the timestamp')
def update_readme(readme_path, overview_path, start_marker, end_marker, timestamp_format, timestamp_prefix):
    # Get the current UTC time
    current_time = datetime.now(timezone.utc).strftime(timestamp_format)

    # Read the current README
    with open(readme_path, 'r') as file:
        readme_content = file.read()

    # Read the generated overview table
    with open(overview_path, 'r') as file:
        new_table = file.read()

    # Create the new content with timestamp
    new_content = f"""{start_marker}
{timestamp_prefix}{current_time}

{new_table}
{end_marker}"""

    # Replace the old table with the new one
    pattern = f"{start_marker}.*?{end_marker}"
    updated_readme = re.sub(pattern, new_content, readme_content, flags=re.DOTALL)

    # Write the updated README
    with open(readme_path, 'w') as file:
        file.write(updated_readme)

    click.echo(f"README updated successfully at {readme_path} on {current_time}")


if __name__ == '__main__':
    update_readme()
