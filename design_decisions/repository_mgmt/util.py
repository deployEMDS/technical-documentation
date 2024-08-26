import os.path
import re
import time
from dataclasses import dataclass
from datetime import datetime
from typing import List, Optional


@dataclass
class TestKpi:
    name: str
    description: str


@dataclass
class TestResult:
    testing_facility: str
    content: str
    path: str
    is_done: bool
    last_modified: Optional[datetime] = None


@dataclass
class TestInformation:
    id: str
    title: str
    description: str
    type: str
    execution_phase: int
    minimal: bool
    path: str
    last_modified: Optional[datetime] = None
    tags: Optional[List[str]] = None
    kpis: Optional[List[TestKpi]] = None
    criteria: Optional[str] = None

@dataclass
class TestResults(TestInformation):
    at_least_one_done: bool = False
    num_results: int = 0
    num_results_done: int = 0
    results: List[TestResult] = None

    def __init__(self, information: TestInformation, results: List[TestResult], at_least_one_done: bool, num_results: int, num_results_done: int):
        self.id = information.id
        self.title = information.title
        self.description = information.description
        self.type = information.type
        self.execution_phase = information.execution_phase
        self.minimal = information.minimal
        self.path = information.path
        self.kpis = information.kpis
        self.criteria = information.criteria
        self.tags = information.tags
        self.last_modified = information.last_modified
        self.at_least_one_done = at_least_one_done
        self.num_results = num_results
        self.num_results_done = num_results_done
        self.results = results

    def __repr__(self):
        return f"{self.id} - {self.title} - {self.type} - {self.execution_phase} - {self.minimal}"


def _is_result_file_done(file_path):
    """Check if a result file is done by counting TODO entries."""
    with open(file_path, 'r') as f:
        content = f.read()
        todo_count = content.count('[TODO]')
        return todo_count <= 6  # Consider done if 6 or fewer TODOs remain


def read_test_criteria(test_content):
    # pattern = r"###.*Comparative[^\n]*\n+(.+?)(?=\n###|$)"
    pattern = r"###.*criteria[^\n]*\n+(.+?)(?=\n###|$)"
    kpi_criteria = re.search(pattern, test_content, re.DOTALL)
    kpi_criteria = kpi_criteria.group(1).strip() if kpi_criteria else 'N/A'
    # print(kpi_criteria)
    return kpi_criteria



def read_test_info(file_path, github_base_url) -> TestInformation:
    with open(file_path, 'r') as f:
        test_content = f.read()
        title_parts = test_content.split('\n')[1].strip('## ').split(' ')
        title = ' '.join(title_parts[1:])
        description = re.search(r"### Test description\s*(.*?)(?=\n###|$)", test_content, re.DOTALL)
        description = description.group(1) if description else 'N/A'
        test_id_numeric = title_parts[0][1:-1]
        execution_phase = re.search(r'Phase (\d+)', test_content)
        execution_phase = execution_phase.group(1) if execution_phase else 'N/A'
        minimal = 'Minimal?\nYes' in test_content
        test_type = re.search(r'Test type\n(.+?)\n', test_content)
        test_type = test_type.group(1) if test_type else 'N/A'
        dir_of_test = str(file_path).split('tests/')[1]
        last_modified = datetime.fromtimestamp(os.path.getmtime(file_path))

        return TestInformation(
            id=test_id_numeric,
            title=title,
            description=description,
            type=test_type,
            execution_phase=int(execution_phase),
            minimal=minimal,
            last_modified=last_modified,
            path=f"{github_base_url}/{dir_of_test}",
            kpis=read_test_kpis(test_content, test_id_numeric),
            criteria = read_test_criteria(test_content)
        )

def read_test_kpis(test_content, test_id_numeric) -> List[TestKpi]:
    kpi_names = re.search(r"#### ISO25010 Quality\s*(.*?)(?=\n####|\n###|$)", test_content, re.DOTALL)
    kpi_names = (kpi_names.group(1) if kpi_names else '').split('\n')
    kpi_descs = re.search(r"#### ISO25010 Quality description\s*(.*?)(?=\n####|\n###|$)", test_content, re.DOTALL)
    kpi_descs = (kpi_descs.group(1) if kpi_descs else '').split('\n')
    kpi_names = [name.strip() for name in kpi_names if name.strip()]
    kpi_descs = [desc.strip() for desc in kpi_descs if desc.strip()]
    if len(kpi_names) != len(kpi_descs):
        print(f'KPI names and descriptions do not match for {test_id_numeric}', kpi_names, kpi_descs)
    return [TestKpi(name, desc) for name, desc in zip(kpi_names, kpi_descs)]

def read_test_result(file_path, github_base_url) -> TestResult:
    with open(file_path, 'r') as f:
        result_content = f.read()
        stack_groups = re.search(r'Stack: *(.+?)\n', result_content)
        stack = stack_groups.group(1) if stack_groups else file_path.stem.replace('result_', '')
        result_groups = re.search(r'Statement of asses*ment\n((.|\n)*)', result_content, re.DOTALL)
        result = result_groups.group(1) if result_groups else 'N/A'
        result_done = _is_result_file_done(file_path)
        dir_of_test_result = str(file_path).split('tests/')[1]
        last_modified = datetime.fromtimestamp(os.path.getmtime(file_path))

        return TestResult(
            testing_facility=stack,
            content=result,
            is_done=result_done,
            last_modified=last_modified,
            path=f"{github_base_url}/{dir_of_test_result}"
        )
