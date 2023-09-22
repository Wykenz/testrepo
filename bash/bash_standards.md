# Bash script

# Abstract
This document contains the principles, standards and policies that need to be followed during bash scripting.

# Basics
## Indentation
A TAB character is used for indentation.
If TAB cannot be used (eg. in displaying a message, YAML file, etc., then 4 space characters are used.)

## End of file
Files cannot end with a newline character.

## .editorconfig
Each repository should contain an `.editorconfig` file with the required settings. Editors need to be configured to utilize the file.
An sample [file](.editorconfig) is enclosed.

# Shellcheck

## .shellcheckrc

# Variables
* Words are separated via underscores.
* When referring to a directory the `DIR_` prefix is used.

* Global variable names are uppercase.
```
VAR="content"
```

* Local variable names are lowercase.
```
local var="content"
```

* External variables are prefixed via `LIFERAY_`.
* In order prevent globbing and word splitting variables are called in a safe way: `"${VAR}"`. See [Shellcheck - SC2086](https://www.shellcheck.net/wiki/SC2086).

# Segmentation

- Put an empty line between different type of commands
```
VAR=${1}

echo "${VAR}"
```

# Switches
The [sample.sh](sample.sh) file contains the standard format and can be used as a template.

# Functions

## Structure
Scripts are organized into functions that can be called individually. The main logic and the parts of the script are called from the `main` function. At the bottom of the script the main function is called.

## Syntax
The following is the accepted syntax:
```
verb_function {
	# commands
}
```

## Naming
The name starts with a verb and it is illustrative overall, except for `lcd` and `main`.
If it is expected to return data, it specifically starts with the `get_` prefix (e.g. `get_latest_available_zulu_version`).
If it is changes a value, it specifically start with the `set_` prefix (e.g. `set_vm_max_map_count`).

Reserved function names:
* `check\_usage`: Evaluate command line switches and calling print\_help or in simple cases evaluate input data and printing help text.
* `lcd`: Safe `cd`
* `main`: Processing the main logic.
* `print\_help`: Print help text.

# Alphabetical order
* Command switches (unless if the command functionality needs it differently), functions and variables are used in alphabetical order.

# Arguments handling
If a script utilize arguments the `check_usage` function handles the arguments. Default values are defined at the start of the function. Mandatory arguments are validated at the end of the function.
A `print_help` function is always created to display a detailed help text. Examples can be found in [sample.sh](sample.sh).

# Displaying empty lines
Empty lines are displayed with `echo ""`, the `echo -e "\nText\n"` format is not allowed.

# Exit codes
Reserved exit codes:
 - 0: Everything is fine
 - 1: Something is wrong
 - 2: Printed help message, did not do anything
 - 3: Changing directory failed unexpectedly (see `lcd`)

# Shared functions
If functions or variables are shared between scripts in the same domain a file called `_common.sh` is utilized.

## _liferay_common.sh
A top level collection of functions is maintained in the [liferay/liferay-docker](https://github.com/liferay/liferay-docker) repository.
If it is included it copied to the local directory and updated manually if the upstream file changes.

Examples can be found in [sample.sh](sample.sh).

# if..fi
The following synax is used

## Variable comparison
```
if [ "${VAR}" = "value" ]
then
	...
else
	...
fi
```

Numbers (eg. return codes) are compared arithmetically
```
if [ "${return_code}" -eq 0 ]
then
	echo "Succeed."
else
	echo "Fail."

	exit 1
fi

```

## Command execution
```
if (command)
then
	...
fi
```

# String manipulation
When possible strings are manipulated via Bash's internal functionality called [parameter-expansions](https://devhints.io/bash#parameter-expansions).
