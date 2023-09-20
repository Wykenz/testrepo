# Bash scripting at Liferay


## Tab

- Make sure you use tab instead of spaces for segmentation
- Check your editor's settings if spaces set automatically

## Variables

- Global variables are uppercase 
```
VAR="content"
```
- local variables are lowercase and seperatedly declared
```
local var

var="content"
```
- When calling a variable use it like "${VAR}" not just $VAR. Sometimes the "" can be left out

## Empty lines

- Don't need empty line after the staring and ending line in any function like for, while, if, case
```
if [ -n "${VAR}" ]
then
	echo "${VAR}"

	exit 0
else
	echo "Variable not set"
fi
```
- In case statements, put an empty line before the ;;
```
case ${VAR} in
	-a)
		CONTENT=a

		;;
	-b)
		CONTENT=b

		;;
	*)
		echo "No match"

		;;
esac
```
- Put an empty line between different type of commands
```
VAR=${1}

echo "${VAR}"
```
- Put an empty line between functions

## Defining functions

- This is the syntax we use
```
function name {
	content
}
```

## Alphabetical order

- Use alphabetical order when defining functions and variables
- Use alphabetical order with command arguments (exception if it makes the code functionally wrong)

## Naming guidelines

### Function naming:
- Functions names should start with a verb. E.g `check_usage` or `print_data`. If a function returns data it should start with `get_ like` `get_latest_available_zulu_version`. When the function changes some value, it should start with `set_` like `set_vm_max_map_count`.

### Default function names:
- check_usage
- lcd
- main
- print_help