def get_secrets(skid,sk):
    import boto3
    import json
    client = boto3.client('secretsmanager')
    response = client.get_secret_value(SecretId=skid)
    secret_value = response['SecretString']
    secrets = json.loads(secret_value)
return secrets[sk]
