# Zuul Scripts
Set of tools to add the zuul docker-compose necessary dependecies to a service based in the Schibsted Spain's template. It contains scripts to initialize the Zuul database (Dynamodb) with the default configuration along with scripts to add your service behind Zuul.

# How to use it
In order to set your service to have Zuul as a dependency (with all Zuul dependencies) you must execute the following script from the root folder of your service: 
`curl -sL https://github.com/scm-spain/zuul-tools/raw/master/setup-zuul.sh |bash`

This will create the zuul folder with all necessary scripts for Zuul to start and to configure your service behind Zuul

## How to add my service behin Schibsted Spain's Zuul
 Once you have executed the setup script you can follow next steps to start Zuul and configure your service:
 1) docker-compose up in the root folder of your service
 2) Start your service
 3) Once docker-compose is up and running you can execute the script zuul/addService.sh service_name docker_ip:port (i.e zuul/addService.sh myservice 192.168.99.100:8001)
 4) It can take up to a max of 30 seconds for Zuul to realize of the new configured service but you should the be able to access your service using https
