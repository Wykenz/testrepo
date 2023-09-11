#!/bin/bash

ADDRESSBOOK_FILE="book.txt"
ACTION=$1
EMAIL=$2
FIRSTNAME=$3
LASTNAME=$4
PHONE=$5


function add_entry {

	if [[ -z "${PHONE}" ]]
	then
		echo -e "\e[31mAll entries are required. Write in email, Firstname, Lastname, phone number!\e[0m"
	else
		if grep "${EMAIL}" "${ADDRESSBOOK_FILE}"
		then
			echo -e "\e[31mEmail already exists.\e[0m"
		else
			echo "${FIRSTNAME}|${LASTNAME}|${EMAIL}|${PHONE}" >> "${ADDRESSBOOK_FILE}"
			echo -e "\e[32mEntry added successfully.\e[0m"
		fi
	fi
	}

function edit_entry {

	if [[ -z "${PHONE}" ]]
	then
		echo -e "\e[31mAll entries are required. Write in email, Firstname, Lastname, phone number!\e[0m"
	else
		if grep -iw "${EMAIL}" "${ADDRESSBOOK_FILE}"
		then
			sed -iw "/${EMAIL}/d" "${ADDRESSBOOK_FILE}"

			echo "${FIRSTNAME}|${LASTNAME}|${EMAIL}|${PHONE}" >> "${ADDRESSBOOK_FILE}"
			echo -e "\e[32mEntry edited successfully.\e[0m"

			grep -i "${EMAIL}" "${ADDRESSBOOK_FILE}"
		else
			echo -e "\e[31mEntry not found.\e[0m"
		fi
	fi
}

function remove_entry {

		if grep -iw --color "${EMAIL}" "${ADDRESSBOOK_FILE}"
		then
			echo -e "\e[31mAre you sure you want to remove this entry? (y/n)\e[0m"

			read -r choice

			if [ "${choice}" = "y" ]
			then
				sed -i "/${EMAIL}/d" "${ADDRESSBOOK_FILE}"

				echo -e "\e[32mEntry removed successfully.\e[0m"
			fi
		else
			echo -e "\e[31mEntry not found.\e[0m"
		fi
	}

function search_entries {    

	grep -iw --color "${FIRSTNAME}\|${LASTNAME}\|${EMAIL}\|${PHONE}" "${ADDRESSBOOK_FILE}"
}

function main {

	case "${ACTION}" in
			search) 
				search_entries

				;;

			add) 
				add_entry 

				;;

			remove) 
				remove_entry

				;;

			edit) 
				edit_entry

				;; 
				
			(*) 
				echo -e "\e[31mStart with an action: |search|add|remove|edit|\e[0m" 

				;;

	esac

}
main