#!/bin/bash

function usage() {
	cat << EOF
Generate a secrethub config file named CONFIG for repositories specified in REPOSITORIES with secrets specified in SECRETS

Usage: 
	secrethub-config-generator.sh [REPOSITORIES] [SECRETS] [CONFIG]

Defaults: 
	REPOSITORIES=repositories.sh 
	SECRETS=secrets.sh 
	CONFIG=config.yaml
EOF
	exit 0
}

[ "$1" = "--help" ] && usage

[ -z "$1" ] && source "$(pwd)/repositories.sh" || source $1
[ -z "$2" ] && source "$(pwd)/secrets.sh" || source $2
config_file_name=$([ -z "$3" ] && echo config.yaml || echo $3)

echo "" > $config_file_name

for repository in "${repositories[@]}"
do
	echo $repository: >> $config_file_name

	for secret in "${secrets[@]}"
	do
		echo "  "$secret >> $config_file_name
	done
	echo "" >> $config_file_name
done
