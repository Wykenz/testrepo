#!/bin/bash

set -eo pipefail

source "$(dirname "$(readlink /proc/$$/fd/255 2>/dev/null)")/_common.sh"

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

function print_help {
	echo ""
	echo "Usage:"
	echo ""
	echo "${0} [--enabler-argument] [--parameterized-switch <parameter>]"
	echo ""
	echo "    --enabler-argument:                       Enabling/disabling something"
	echo "    --parameterized-argument <parameter>:    Setting something to a parameter"
	echo ""
	echo "Example:"
	echo ""
	echo "${0} --enabler-argument --parameterized-switch value"
	echo ""

	exit "${LIFERAY_COMMON_EXIT_CODE_HELP}"
}

function sample_function {
	echo "${ENABLER_ARGUMENT}"
	echo "${PARAMETERIZED_ARGUMENT}"
}

function main {
	check_usage "${@}"

	# rest of functions...
}

main "${@}"