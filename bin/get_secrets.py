import boto3
import json
import argparse

def main():
    parser = argparse.ArgumentParser(description='Sample Python Script')
    parser.add_argument('--arg1', help='Argument 1')

    args = parser.parse_args()

    print(f"Argument 1: {args.arg1}")

    client = boto3.client('secretsmanager')
    response = client.get_secret_value(SecretId={args.arg1})
    secret_value = response['SecretString']
    secrets = json.loads(secret_value)
    print(secrets['host'])
    print(secrets['username'])
    print(secrets['password'])

if __name__ == '__main__':
    main()
