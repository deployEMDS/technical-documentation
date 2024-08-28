## deployEMDS Test Management Scripts

### Overview

This repository contains two Python scripts designed to automate the process of managing and creating GitHub issues and test documentation for the deployEMDS (European Mobility Data Space) project. These scripts work with Excel spreadsheets containing test data and generate structured GitHub issues and markdown files for test documentation.

### Scripts

1. `create_github_issues.py`: Creates GitHub issues based on test data from an Excel file.
2. `create_test_files.py`: Generates a directory structure and markdown template files for test documentation based on the tests in the Excel file.

### Prerequisites

- Python 3.11+
- Required Python packages:
    - pandas
    - click
    - PyGithub
    - python-dotenv
    - Jinja2
    - openpyxl

You can install these packages using:
```bash
pip install pandas click PyGithub python-dotenv Jinja2 openpyxl
```
Or you can use the included `requirements.txt` file to install all the required packages:
```bash
pip install -r requirements.txt
```

### Setup

1. Clone this repository to your local machine.
2. Create a `.env` file in the root directory with the following content:
```plaintext
GITHUB_TOKEN=your_github_token_here
GITHUB_ENTERPRISE_URL=your_github_enterprise_url_here
GITHUB_REPO_NAME=owner/repo_name
```
Replace `your_github_token_here` with your GitHub personal access token, `your_github_enterprise_url_here` with your GitHub Enterprise URL (if applicable), and `owner/repo_name` with the owner and name of the repository where you want to create the issues. Make sure the token has the necessary permissions to create issues in the repository. See also the included `.env.example` file for reference.

### Usage

#### Creating GitHub Issues
Run the `create_github_issues.py` script with the following command:
```bash
python create_github_issues.py --stack "EDC+VC" --stack Fiware --phase 1 --phase 2
```
Replace the `--stack` and `--phase` arguments with the desired values. The script will create GitHub issues based on the test overviews in the Excel file.

```bash
$ python create_github_issues.py --help
Usage: create_github_issues.py [OPTIONS]

Options:
  --excel-file PATH  The Excel file with the test backlog.  [default:
                     EMDS_D24_TestingBacklog_Macro_20240628.xlsm]
  --sheet-name TEXT  The name of the sheet in the Excel file.  [default: List
                     of tests]
  --stack TEXT       The stack(s) to create issues for.  [default: EDC+VC,
                     Fiware]
  --phase INTEGER    The phase(s) to create issues for.  [default: 1, 2, 3]
  --only-minimal     Only create issues for minimal tests.
  --help             Show this message and exit.
```

#### Creating Test Documentation Files
Run the `create_repo_structure.py` script with the following command:
```bash
python create_repo_structure.py --base-dir /path/to/base/directory --stacks "EDC+VC" Fiware
```
Replace the `--base-dir` and `--stacks` arguments with the desired values. The script will generate a directory structure and markdown template files for test documentation based on the tests in the Excel file.

```bash
$ python create_repo_structure.py --help
Usage: create_repo_structure.py [OPTIONS]

  Create test and result files from Excel data.

Options:
  --excel-file PATH  The Excel file with the test backlog.  [default:
                     EMDS_D24_TestingBacklog_Macro_20240628.xlsm]
  --sheet-name TEXT  The name of the sheet in the Excel file.  [default: List
                     of tests]
  --base-dir PATH    Base directory for test files  [required]
  --stack TEXT       List of stacks to process  [default: EDC+VC, Fiware]
  --help             Show this message and exit.
```
#### Create Comparative Matrix Table

`python create_result_table.py --base-dir ../../tests --output-file ../../web/docs/tech-testing/results/overview_matrix.mdx --github-base-url https://github.com/imec-int/deployEMDS`

#### File Structure

The `create_repo_structure.py` script will generate the following directory structure:
```plaintext
base_dir/
├── business_capability/
│   ├── customer_journey/
│   │   ├── customer_sub_journey/
│   │   │   ├── test_id/
│   │   │   │   ├── test.md
│   │   │   │   ├── result_stack1.md
│   │   │   │   ├── result_stack2.md
│   │   │   │   └── .gitkeep
```

#### Customization
You can customize the output of both scripts by modifying the template files in the `templates` directory:

- `issue.md`: Template for GitHub issues
- `test.md`: Template for test documentation
- `result.md`: Template for test results

These templates use Jinja2 syntax for dynamic content.

## Contributing
Feel free to submit issues or pull requests if you have suggestions for improvements or encounter any problems.