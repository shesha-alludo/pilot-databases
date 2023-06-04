import boto3
import json
import argparse

def get_aws_secret(secret_id):
    client = boto3.client('secretsmanager')
    response = client.get_secret_value(SecretId=secret_id)
    secret_value = response['SecretString']
    secrets = json.loads(secret_value)
    print(secrets['host'])
    print(secrets['username'])
    print(secrets['password'])

    return secret_value
