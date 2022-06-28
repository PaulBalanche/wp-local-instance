#!/bin/bash
rm composer.json
rm composer.lock
rm -r vendor
mv bedrock/* .
mv bedrock/.env .env
mv bedrock/.gitignore .gitignore
rm -r bedrock
rm post-create-project-cmd.sh