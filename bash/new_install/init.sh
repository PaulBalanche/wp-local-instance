#!/bin/bash
echo ''
echo '#################################### Bedrock init ####################################'
echo ''
source bash/new_install/bedrock/init.sh

echo ''
echo ''
echo ''
echo '#################################### Env setup ####################################'
echo ''
source bash/new_install/bedrock/env_setup.sh

cd docker
make wp-first-start
make composer-install
make wp-core-install
cd ..