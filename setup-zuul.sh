#!/bin/bash

curl -L https://github.com/scm-spain/zuul-tools/raw/master/tar/zuul.tar.gz | tar zx

curl -L -O https://github.com/scm-spain/zuul-tools/raw/master/docker-compose-zuul.yml

if [ -f docker-compose.yml ]; then
	echo "You already have a docker-compose.yml file. You want the new docker compose to overwrite this file?  (If select 'No' a new docker-compose-zuul.yml will be created)"	
	select yn in "Yes" "No"; do
    		case $yn in
        		Yes ) mv -f docker-compose-zuul.yml docker-compose.yml; break;;
        		No ) echo "Leaving docker-compose-zuul.yml as is"; exit;;
    		esac
	done
else
         mv -f docker-compose-zuul.yml docker-compose.yml;
fi
