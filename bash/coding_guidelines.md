# Coding guidelines
---
Examples can be found in [sample.sh](sample.sh).
## Alphabetical Order
Always use alphabetical order when defining functions and variables.

Example:

	function get_latest_available_zulu_version {
		local version=$(curl -H 'accept: */*' -L -s "https://api.azul.com/zulu/download/community/v1.0/bundles/latest/?arch=${2}&bundle_type=jdk&ext=deb&hw_bitness=64&javafx=false&java_version=${1}&os=linux" | jq -r '.zulu_version | join(".")' | cut -f1,2,3 -d'.')

		echo "${version}"
	}

	function get_latest_docker_hub_version {
		local token=$(curl -s "https://auth.docker.io/token?scope=repository:liferay/${1}:pull&service=registry.docker.io" | jq -r '.token')

		local version=$(curl -s -H "Authorization: Bearer $token" "https://registry-1.docker.io/v2/liferay/${1}/manifests/latest" | grep -o '\\"org.label-schema.version\\":\\"[0-9]\.[0-9]\.[0-9]*\\"' | head -1 | sed 's/\\"//g' | sed 's:.*\:::')

		echo "${version}"
	}

When executing code that takes arguments use alphabetical order if possible, the only exceptions are when the command requires the arguments to be passed in a certain order, like in case of mysql.

Example:

	curl -H 'accept: */*' -L -s -X 'GET' -o /tmp/jdk11.deb "https://api.azul.com/zulu/download/community/v1.0/bundles/latest/binary/?arch=${TARGETARCH}&bundle_type=jdk&ext=deb&hw_bitness=64&java_version=11.0&javafx=false&os=linux&zulu_version=${LABEL_ZULU_11_VERSION}"

## Argument Handling
When the script requires argument(s) create a `check_usage` function which handles the arguments with a while loop. Define the default values for optional arguments at the start of the function. If the argument is a flag (e.g.: no value is passed after it, like help) don't use the `shift` keyword, if a value is passed after an argument use the `shift` keyword and assign the value of `$1` to the destination variable. After the loop check if the mandatory arguments are set.
Always create a help function when using arguments called `print_help`.

Example:

function check_usage {
	ENABLER_ARGUMENT="false"
	PARAMETERIZED_ARGUMENT="default-value"

	[[ "$#" -eq 0 ]] && print_help

	while [ "$#" -gt "0" ]
	do
		case "${1}" in
			--enabler-argument)
				ENABLER_ARGUMENT="true"

				;;

			--parameterized-argument)
				PARAMETERIZED_ARGUMENT="${2}"

				shift 1

				;;

			*)
				print_help

				;;
		esac

		shift 1

		if [ -z "${PARAMETERIZED_ARGUMENT}" ]
		then
			echo "The '--parameterized-argument' argument is mandatory."

			exit 1
		fi

	done
}

## cd into directories
Instead of just running "cd /tmp/test", create a method called `lcd` and use this method to move between folders. This will ensure that the script will exit if the cd was not successful.

Example:

	function lcd {
		cd "${1}" || exit 3
	}

## Checking if a string contains another one
Use `grep -q` when checking for a substring.

Example:

	if (git remote | grep -q upstream)
	then
		git fetch upstream --tags
	else
		git fetch origin --tags
	fi

## Checking if a variable is set
Don't use the `-z` or `-v` options to check if a variable is empty, use `! -n`.

Example:

	if [ ! -n "${DOMAIN}" ]
	then
		echo "The domain argument is required."

		exit 1
	fi

## Command substitution
For command substitution use `$(CMD)` instead of **\`CMD\`**

Example:

	curl_content=$(echo "${curl_content}" | grep" ${CONTENT}")
## Condition declaration
Never use semicolon separated conditions. Use the following format:

	if condition
	then
	echo "Do something"
	elif condition
	then
		echo "Do something else"
	else
		echo "Do nothing"
	fi

Example:

	if [ "${PIPESTATUS[0]}" -gt 0 ]
	then
		echo "FAILED: JDK 11" >> "${LOGS_DIR}/results"

		exit 1
	else
		echo "SUCCESS: JDK 11" >> "${LOGS_DIR}/results"
	fi

## Creating directories
When creating a directory always use the `-p` argument. This will create the parent directories as needed and won't throw an error if they do exits, making any folder check unnecessary.

Example:

	mkdir -p "/tmp/test/test2/destination"
## Function declaration
Alway use the function keyword without the round brackets when declaring a function.

Example:

	function set_parent_image {
		if [ "$(echo "${LIFERAY_DOCKER_RELEASE_VERSION%-*}" | cut -f1,2,3 -d'.' | cut -f1 -d '-' | sed 's/\.//g' )" -le 7310 ]
		then
			sed -i 's/liferay\/jdk11:latest/liferay\/jdk11-jdk8:latest/g' "${TEMP_DIR}"/Dockerfile
		fi
	}

## Help Function
Always create a help function when using arguments called `print_help`.

Example:

	function print_help {
		echo "Usage: ${0} -c <content> -d <domain> -f <path> -p <port> -t <timeout> -z <connection-timeout>"
		echo ""
		echo "The script can be configured with the following arguments:"
		echo ""
		echo "  -c (optional): Content that the response must contain"
		echo "	-d (required): Domain of the URL to check"
		echo "	-f (optional): Path of the URL to check"
		echo "  -p (optional): HTTP port of the URL to check"
		echo "	-t (optional): Timeout in seconds"
		echo "	-z (optional): Connection timeout in seconds"
		echo ""
		echo "Example: ${0} -d \"http://localhost\" -f \"/c/portal/layout\"" -p 8080 -t 20

		exit 2
	}

## Multiline echo
Don't use the `-e` option for echo, instead use multiple echo command.

Example:

	echo ""
	echo "Building Docker image Base."
	echo ""

## Line break separation
Always put a new line before an `exit` or `return` command.

Example:

	if [ ! -n "${DOMAIN}" ]
	then
		echo "The domain argument is required."

		exit 1
	fi


## String handling
Use [this guide](https://devhints.io/bash#parameter-expansions).


## Timestamp format
For timestamp always use the following format: `year-month-day_hour-minute-second'`

Example:

	local timestamp=$(date +'%Y-%m-%d_%H-%M-%S')
## Variable handling
Always use curly bracket for variables.

Example:

	version="${version},${additional_tags}"
