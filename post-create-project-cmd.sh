#!/bin/bash
rm composer.json
rm composer.lock
rm -r vendor
mv bedrock/* .
mv bedrock/.env .env
mv bedrock/.gitignore .gitignore
rm bedrock