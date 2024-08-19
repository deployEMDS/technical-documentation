import json
import os
import re
import warnings

import click
import pandas as pd
from dotenv import load_dotenv
from jinja2 import Environment, FileSystemLoader

# Default configurations
DEFAULT_EXCEL_FILE = '../background_info/testing_backlog.xlsm'
DEFAULT_SHEET_NAME = 'Customer journeys'
CATEGORY_DICT_TEMPLATE = {
    "label": "LABEL",
    "position": -1,
    "link": {
        "type": "generated-index",
        "description": "DESCRIPTION"
    }
}



# Set up Jinja2 environment
template_env = Environment(loader=FileSystemLoader('templates'))

load_dotenv()


@click.command()
@click.option('--excel-file', default=DEFAULT_EXCEL_FILE, help='The Excel file with the test backlog.', show_default=True, type=click.Path(exists=True))
@click.option('--sheet-name', default=DEFAULT_SHEET_NAME, help='The name of the sheet in the Excel file.', show_default=True, type=str)
@click.option('--base-dir', required=True, type=click.Path(), help='Base directory for test files')
def create_web_structure(excel_file, sheet_name, base_dir):
    """Create test and result files from Excel data."""
    # Read the Excel file
    with warnings.catch_warnings():
        warnings.filterwarnings("ignore", category=UserWarning)
        df = pd.read_excel(excel_file, sheet_name=sheet_name)

    for _, row in df.iterrows():
        _process_journey(row, base_dir)

    click.echo("Directory structure and files created successfully.")


def _sanitize_filename(name):
    """Convert a string to a valid filename."""
    return re.sub(r'(\s|\u180B|\u200B|\u200C|\u200D|\u2060|\uFEFF|/|\.)+', '_', str(name)).lower()


def _create_directory(path):
    """Create a directory if it doesn't exist."""
    os.makedirs(path, exist_ok=True)

def _create_category_json(path, label, description, position):
    """Create a category.json file."""
    category_dict = CATEGORY_DICT_TEMPLATE.copy()
    category_dict['label'] = label
    category_dict['position'] = position
    category_dict['link']['description'] = description

    with open(os.path.join(path, '_category_.json'), 'w') as f:
        json.dump(category_dict, f, indent=2)

def _create_csj_intro_md(path, csj_title, csj_desc, phase):
    """Create a CSJ intro markdown file."""
    template = template_env.get_template('csj_page.jinja2')
    with open(os.path.join(path, 'intro.md'), 'w') as f:
        f.write(
            template.render(
                customer_sub_journey_title=csj_title,
                customer_sub_journey_description=csj_desc,
                execution_phase=phase,
                tags=[csj_title],
            )
        )


def _process_journey(row, base_dir):
    """Process a single row of data and create necessary files and directories."""
    business_capability = row['Business capability']
    business_capability_dir = _sanitize_filename(business_capability)
    customer_journey = row['Customer journey']
    customer_journey_dir = _sanitize_filename(customer_journey)
    customer_sub_journey = row['Customer sub-journey']
    customer_sub_journey_dir = _sanitize_filename(customer_sub_journey)


    bc_path = os.path.join(base_dir, business_capability_dir)
    cj_path = os.path.join(bc_path, customer_journey_dir)
    csj_path = os.path.join(cj_path, customer_sub_journey_dir)
    _create_directory(csj_path)

    _create_category_json(csj_path, customer_sub_journey, row['Customer sub-journey description'], row['CSJ ID'])
    _create_category_json(cj_path, customer_journey, row.get('Customer journey description', default='Test'), row['CJ ID'])
    _create_category_json(bc_path, business_capability, row.get('Business capability description', default='Test'), row['BC ID'])
    # _create_csj_intro_md(csj_path, customer_sub_journey, row['Customer sub-journey description'], row['Execution phase'])

    click.echo(f"Created directories for {business_capability} > {customer_journey} > {customer_sub_journey}")


if __name__ == '__main__':
    create_web_structure()
