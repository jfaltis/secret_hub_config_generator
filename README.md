# SecretHub Config Generator

A config file generator for [SecretHub](https://github.com/DannyBen/secret_hub). It generates a config file for SecretHub to be used for bulk operations. The config file will assign all given repositories with the given secrets.

## Installation

1. Install [SecretHub](https://github.com/DannyBen/secret_hub)
2. Clone this repository:

```shell
git clone https://github.com/jfaltis/secret_hub_config_generator.git
cd secret_hub_config_generator
```

## Prerequisites

Create one file for the repositories and one file for the secrets:

Example `repositories.sh`

```shell
repositories=(
	"user/repository"
	"organization/repository"
)
```

Example `secrets.sh`

```shell
secrets=(
	"SECRET_NAME: SECRET_VALUE"
)
```

## Usage

Read from `repositories.sh` and `secrets.sh` in working directory and generate `config.yaml`

```shell
./secrethub-config-generator.sh
```

Read from specific repositories and secrets file and generate `config.yaml`

```shell
./secrethub-config-generator.sh /path/to/repositories /path/to/secrets
```

Read from specific repositories and secrets file and generate to a specific file

```shell
./secrethub-config-generator.sh /path/to/repositories /path/to/secrets /path/to/config
```

Based on the example repositories and secrets file the following output will be generated:

```shell

user/repository:
  SECRET_NAME: SECRET_VALUE

organization/repository:
  SECRET_NAME: SECRET_VALUE

```
