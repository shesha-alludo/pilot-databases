import json
import boto3
import sys

client = boto3.client('secretsmanager')
response = client.get_secret_value(SecretId=sys.argv[2])
secret_value = response['SecretString']
secrets = json.loads(secret_value)

file = open(sys.argv[1], "w")
file.write("driver: org.postgresql.Driver\n")
file.write("username: +secrets['username']\n")
file.write("password: +secrets['password']\n")
file.write("url: +secrets['host']\n")
file.close()
