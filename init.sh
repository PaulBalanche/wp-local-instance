#!/bin/bash

echo ''
echo '#################################### Bedrock init ####################################'
echo ''
source bash/0_bedrock_init.sh

echo ''
echo ''
echo ''
echo '#################################### Env setup ####################################'
echo ''
source bash/1_env_setup.sh

rm -r bash
rm init.sh