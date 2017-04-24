#!/usr/bin/env bash
if [ $# -ne 1 ]; then
    echo $0: usage: createDefaultProperties.sh dynamoIPAndPort 'e.g. ./createDefaultProperties.sh dynamodb.eu-west-1.amazonaws.com global-pre'
    exit 1
fi

## Default properties for Zuul
aws dynamodb update-item --table-name zuulArchaiusProperties --key '{"zuulkey":{"S":"hystrix.command.default.execution.isolation.thread.timeoutInMilliseconds"}}' --update-expression "SET zuulvalue = :y" --expression-attribute-values '{":y":{"S":"1000"}}' --return-values ALL_NEW --endpoint-url http://$1
aws dynamodb update-item --table-name zuulArchaiusProperties --key '{"zuulkey":{"S":"zuul.client.ReadTimeout"}}' --update-expression "SET zuulvalue = :y" --expression-attribute-values '{":y":{"S":"1500"}}' --return-values ALL_NEW --endpoint-url http://$1
aws dynamodb update-item --table-name zuulArchaiusProperties --key '{"zuulkey":{"S":"zuul.client.ServerListRefreshInterval"}}' --update-expression "SET zuulvalue = :y" --expression-attribute-values '{":y":{"S":"10000"}}' --return-values ALL_NEW --endpoint-url http://$1
aws dynamodb update-item --table-name zuulArchaiusProperties --key '{"zuulkey":{"S":"zuul.client.NIWSServerListClassName"}}' --update-expression "SET zuulvalue = :y" --expression-attribute-values '{":y":{"S":"com.netflix.niws.loadbalancer.DiscoveryEnabledNIWSServerList"}}' --return-values ALL_NEW --endpoint-url http://$1
aws dynamodb update-item --table-name zuulArchaiusProperties --key '{"zuulkey":{"S":"zuul.client.MaxAutoRetriesNextServer"}}' --update-expression "SET zuulvalue = :y" --expression-attribute-values '{":y":{"S":"1"}}' --return-values ALL_NEW --endpoint-url http://$1
aws dynamodb update-item --table-name zuulArchaiusProperties --key '{"zuulkey":{"S":"zuul.client.MaxAutoRetries"}}' --update-expression "SET zuulvalue = :y" --expression-attribute-values '{":y":{"S":"1"}}' --return-values ALL_NEW --endpoint-url http://$1
aws dynamodb update-item --table-name zuulArchaiusProperties --key '{"zuulkey":{"S":"zuul.client.FollowRedirects"}}' --update-expression "SET zuulvalue = :y" --expression-attribute-values '{":y":{"S":"false"}}' --return-values ALL_NEW --endpoint-url http://$1
aws dynamodb update-item --table-name zuulArchaiusProperties --key '{"zuulkey":{"S":"zuul.client.ConnectTimeout"}}' --update-expression "SET zuulvalue = :y" --expression-attribute-values '{":y":{"S":"500"}}' --return-values ALL_NEW --endpoint-url http://$1
aws dynamodb update-item --table-name zuulArchaiusProperties --key '{"zuulkey":{"S":"zuul.client.ConnIdleEvictTimeMilliSeconds"}}' --update-expression "SET zuulvalue = :y" --expression-attribute-values '{":y":{"S":"360000"}}' --return-values ALL_NEW --endpoint-url http://$1
aws dynamodb update-item --table-name zuulArchaiusProperties --key '{"zuulkey":{"S":"hystrix.command.default.execution.isolation.semaphore.maxConcurrentRequests"}}' --update-expression "SET zuulvalue = :y" --expression-attribute-values '{":y":{"S":"15"}}' --return-values ALL_NEW --endpoint-url http://$1
aws dynamodb update-item --table-name zuulArchaiusProperties --key '{"zuulkey":{"S":"hystrix.command.default.execution.isolation.semaphore.maxConcurrentRequests"}}' --update-expression "SET zuulvalue = :y" --expression-attribute-values '{":y":{"S":"15"}}' --return-values ALL_NEW --endpoint-url http://$1
