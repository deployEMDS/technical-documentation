import os
import re
from datetime import datetime, timezone

# Change to the root directory of the repository
os.chdir('../..')

# Get the current UTC time
current_time = datetime.now(timezone.utc).strftime("%Y-%m-%d %H:%M:%S UTC")

# Read the current README
with open('README.md', 'r') as file:
    readme_content = file.read()

# Read the generated overview table
with open('overview.tmp.md', 'r') as file:
    new_table = file.read()

# Define the markers for the table section
start_marker = "<!-- START_TEST_RESULTS_TABLE -->"
end_marker = "<!-- END_TEST_RESULTS_TABLE -->"

# Create the new content with timestamp
new_content = f"""
{start_marker}
Last updated: {current_time}

{new_table}
{end_marker}
"""

# Replace the old table with the new one
pattern = f"{start_marker}.*?{end_marker}"
updated_readme = re.sub(pattern, new_content, readme_content, flags=re.DOTALL)

# Write the updated README
with open('README.md', 'w') as file:
    file.write(updated_readme)