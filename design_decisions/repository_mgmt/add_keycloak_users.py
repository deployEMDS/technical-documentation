import json
import random
import string

import click
import requests
from dotenv import load_dotenv

# Load environment variables
load_dotenv()

def generate_temp_password(length=12):
    lowercase = string.ascii_lowercase
    uppercase = string.ascii_uppercase
    digits = string.digits
    symbols = "!@#$%^&*"

    password = [
        random.choice(lowercase),
        random.choice(uppercase),
        random.choice(digits),
        random.choice(symbols)
    ]

    for _ in range(length - 4):
        password.append(random.choice(lowercase + uppercase + digits + symbols))

    random.shuffle(password)
    return ''.join(password)

def create_user(email, temporary_password, keycloak_url, realm_name, access_token):
    users_url = f"{keycloak_url}/admin/realms/{realm_name}/users"
    headers = {
        "Authorization": f"Bearer {access_token}",
        "Content-Type": "application/json"
    }
    payload = {
        "username": email,
        "email": email,
        "emailVerified": True,
        "enabled": True,
        "credentials": [{
            "type": "password",
            "value": temporary_password,
            "temporary": True
        }]
    }
    response = requests.post(users_url, headers=headers, data=json.dumps(payload))
    return response.status_code == 201

def format_email(email, temporary_password, login_url, realm_name):
    return f"""
Dear {email},

You can login to {login_url} with the following details. You will be prompted to change this password after the first login.

Username: {email}
Password: {temporary_password}

Kind regards,
{realm_name} Team
"""

@click.command()
@click.option('--keycloak-url', envvar='KEYCLOAK_URL', required=True, help='Keycloak server URL')
@click.option('--realm-name', envvar='REALM_NAME', required=True, help='Keycloak realm name')
@click.option('--admin-token', envvar='KEYCLOAK_ADMIN_TOKEN', required=True, help='Keycloak admin token')
@click.option('--login-url', envvar='LOGIN_URL', required=True, help='URL for users to login')
@click.argument('email_file', type=click.File('r'))
def process_email_list(keycloak_url, realm_name, admin_token, login_url, email_file):
    """Create Keycloak users from a list of email addresses in a file."""
    for email in email_file:
        email = email.strip()
        if email:
            temp_password = generate_temp_password()
            if create_user(email, temp_password, keycloak_url, realm_name, admin_token):
                print(f"User {email} created successfully")
                print(format_email(email, temp_password, login_url, realm_name))
                print("-" * 50)
            else:
                print(f"Failed to create user {email}")

if __name__ == "__main__":
    process_email_list()