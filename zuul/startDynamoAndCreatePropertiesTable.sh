#!/usr/bin/env bash
## Only for development purpose

/usr/bin/java -Djava.library.path=./DynamoDBLocal_lib -jar DynamoDBLocal.jar -port 8000 -sharedDb -inMemory &
sleep 5s #Give dynamo time to accept queries
/zuul/createPropertiesTable.sh localhost:8000 &
/zuul/createDefaultProperties.sh localhost:8000 &
wait #wait until dynamo is done