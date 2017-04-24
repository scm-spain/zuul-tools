if [ $# -ne 2 ]; then
    echo $0: usage: ./addService.sh servicename dynamoIPAndPort 'e.g. ./addService.sh myservice 192.168.99.100:8001'
    exit 1
fi

zuul/createServiceProperties.sh $1 $2
zuul/addEtcHost.sh $1