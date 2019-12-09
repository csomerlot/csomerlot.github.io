
### This script updates Route53 AWS Cloud service with the DNS record for the public IP


import boto3
import socket
import netifaces

public_ip = ni.ifaddresses('eth0')[AF_INET][0]['addr']
print(public_ip)

#https://github.com/awslabs/route53-dynamic-dns-with-lambda/blob/master/v1/dynamic_dns_lambda.py
client = boto3.client('route53' )
route_53_zone_id     = '' # your zone ID here
route_53_record_name = '' # your FQDN here
route_53_record_type = 'A'
route_53_record_ttl  = 300

response = client.change_resource_record_sets(
            HostedZoneId=route_53_zone_id,
            ChangeBatch={
                'Changes': [
                    {
                        'Action': 'UPSERT',
                        'ResourceRecordSet': {
                            'Name': route_53_record_name,
                            'Type': route_53_record_type,
                            'TTL': route_53_record_ttl,
                            'ResourceRecords': [
                                {
                                    'Value': public_ip
                                }
                            ]
                        }
                    }
                ]
            }
        )
print(response)
