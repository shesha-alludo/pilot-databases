import json
import boto3

def main(fn,skid):
    client = boto3.client('secretsmanager')
    response = client.get_secret_value(SecretId=skid)
    secret_value = response['SecretString']
    secrets = json.loads(secret_value)

    file = open(fn, "w")
    file.write("driver: org.postgresql.Driver\n")
    file.write("username: +secrets['username']\n")
    file.write("password: +secrets['password']\n")
    file.write("url: +secrets['host']\n")
    file.close()

if __name__ == '__main__':
    main(fn,skid)
