# General guidelines
---
## Exit codes
Reserved exit codes:
- 0: Everything is fine
- 1: Something is wrong
- 2: Printed help message, did not do anything
- 3: Changing directory failed unexpectedly (see `lcd`)

## Editor settings
Indentation
- A TAB character is used for indentation.
- If TAB cannot be used (eg. in displaying a message, YAML file, etc., then 4 space characters are used.)	

End of file
- Files cannot end with a newline character.

.editorconfig

- Each repository should contain an `.editorconfig` file with the required settings. Editors need to be configured to utilize the file.
A sample [file](.editorconfig) is enclosed.

## Organize everything in functions
Every step is organized into a bash function. The main function is called `main` and it's called in the end of the script.

Example:

	#!/bin/bash
	
	function a {
		echo ${1}
	}

	function b {
		echo "b"
	}

	function main {
		a ${@}

		b
	}

	main ${@}

## Shared functions
If you are sharing functions between scripts in the same domain, create a `_common.sh` file and source it in the beginning of your shell scripts.

	#!/bin/bash
	
	source ./_common.sh

A top level collection of functions in `_liferay_common.sh` is maintained in the [liferay/liferay-docker](https://github.com/liferay/liferay-docker) repository.
If it is included it copied to the local directory and updated manually if the upstream file changes.

# Naming guidelines
---
## Function naming
Functions names should start with a verb. E.g `check_usage` or `print_data`. If a function returns data it should start with `get_` like `get_latest_available_zulu_version`. When the function changes some value, it should start with `set_` like `set_vm_max_map_count`.

Base functions are functions that are specialized in doing one task and are called by multiple parts of the business logic, such functions should start with an underscore like `_register_dns_record`, `_get_ingress_ip`.

Default function names:
- check_usage
- lcd
- main
- print_help

## Variable naming
1. Local variables are lowercase and always defined with local. Use underscore to separate words: `local base_image_version`.
2. Global variable names are always uppercase: `LOGS_DIR`.
3. External variables are usually prefixed with `LIFERAY_`.
4. When referring to a directory / folder, always use `DIR`.
5. Always refer to the variable with the `${variable_name}` method, examples: `${base_image_version}` or `${LOGS_DIR}`