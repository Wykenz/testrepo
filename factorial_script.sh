#!/bin/bash

calculate_factorial() {
	local n=$1
	local factorial=1

	for (( i = 1; i <= n; i++ )); do
		factorial=$((factorial * i))
	done

	echo "$factorial"
}
echo -n "Enter a number: "
read number

result=$(calculate_factorial "$number")

echo "Factorial of $number is $result" > factorial_output.txt

echo "Factorial calculation complete. Check 'factorial_output.txt' for the result."
