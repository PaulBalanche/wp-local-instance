#!/bin/bash
composer create-project roots/bedrock --no-install
rm composer.json
mv bedrock/* .
mv bedrock/.gitignore .gitignore
rm -r bedrock