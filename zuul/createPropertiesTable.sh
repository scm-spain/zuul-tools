#!/usr/bin/env bash
## Only for development purpose
if [ $# -ne 1 ]; then
    echo $0: usage: createPropertiesTable.sh dynamoIP 'e.g. 192.168.99.100:8000'
    exit 1
fi
aws dynamodb create-table --table-name zuulArchaiusProperties --attribute-definitions AttributeName=zuulkey,AttributeType=S --key-schema AttributeName=zuulkey,KeyType=HASH  --provisioned-throughput ReadCapacityUnits=1,WriteCapacityUnits=1 --endpoint-url http://$1
echo "Creating ZuulArchaiusProperties Table"
sleep 1
aws dynamodb update-item --table-name zuulArchaiusProperties --key '{"zuulkey":{"S":"zuul.niws.clientlist"}}' --update-expression "SET #Y = :y" --expression-attribute-names '{"#Y":"zuulvalue"}' --expression-attribute-values '{":y":{"S":"firstFakeService"}}' --return-values ALL_NEW --endpoint-url http://$1
