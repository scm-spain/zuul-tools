#!/usr/bin/env bash
## Only for development purpose
if [ $# -ne 2 ]; then
    echo $0: usage: ./createServiceProperties.sh servicename dynamoIPAndPort 'e.g. ./createServiceProperties.sh myservice dynamodb.eu-west-1.amazonaws.com'
    exit 1
fi



## Insert ms-example-zuul properties in dynamoDb
aws dynamodb update-item --table-name zuulArchaiusProperties --key '{"zuulkey":{"S":"zuul.niws.service.'$1'"}}' --update-expression "SET zuulvalue = :y" --expression-attribute-values '{":y":{"S":"'$1'"}}' --return-values ALL_NEW --endpoint-url http://$2
aws dynamodb update-item --table-name zuulArchaiusProperties --key '{"zuulkey":{"S":"'$1'.zuul.client.DeploymentContextBasedVipAddresses"}}' --update-expression "SET zuulvalue = :y" --expression-attribute-values '{":y":{"S":"'$1'"}}' --return-values ALL_NEW --endpoint-url http://$2

## Trigger for zuul to recognize new service (indeed, in this project is not needed)
aws dynamodb update-item --table-name zuulArchaiusProperties --key '{"zuulkey":{"S":"zuul.niws.clientlist"}}' --update-expression "SET #Y = :y" --expression-attribute-names '{"#Y":"zuulvalue"}' --expression-attribute-values '{":y":{"S":"'$(date +%s)'"}}' --return-values ALL_NEW --endpoint-url http://$2
