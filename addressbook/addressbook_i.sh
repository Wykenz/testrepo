#!/bin/bash
		
	ADDRESSBOOK_FILE="addressbook.txt"

	function display_menu {
		echo
		echo "Addressbook Menu:"
		echo "1. Search address book"
		echo "2. Add entries"
		echo "3. Remove entries"
		echo "4. Edit entries"
		echo "5. Exit"
	}

	function search_entries {
		echo -n "Enter search term: "
		read -r search_term
		echo
		grep -i "${search_term}" "${ADDRESSBOOK_FILE}"
	}

	function add_entry {
		echo -n "Firstname: "
		read -r firstname
		echo -n "Lastname: "
		read -r lastname

		while true
		do
			echo -n "Email: "
			read -r email
			if [ -z "${email}" ]
			then
				echo -e "\e[31mEmail cannot be empty. Please try again.\e[0m"
			else
				break
			fi
		done
		echo -n "Phone: "
		read -r phone
		
		# Check for duplicates
		if grep -i "${email}" "${ADDRESSBOOK_FILE}"
		then
			echo -e "\e[31mAn entry with this email already exists. Do you want to edit it? (y/n)\e[0m"
			read -r choice
			if [ "${choice}" = "y" ]
			then
				sed -i "/${email}/d" "${ADDRESSBOOK_FILE}"
			else
				return
			fi
		fi
		
		echo "${firstname}|${lastname}|${email}|${phone}" >> "${ADDRESSBOOK_FILE}"
		echo -e "\e[32mEntry added successfully.\e[0m"
	}

	function remove_entry {
		echo -n "Enter email to remove: "
		read -r email
		if grep -i "${email}" "${ADDRESSBOOK_FILE}"
		then
			echo -e "\e[31mAre you sure you want to remove this entry? (y/n)\e[0m"
			read -r choice
			if [ "${choice}" = "y" ]
			then
				sed -i "/${email}/d" "${ADDRESSBOOK_FILE}"
				echo -e "\e[32mEntry removed successfully.\e[0m"
			fi
		else
			echo -e "\e[31mEntry not found.\e[0m"
		fi
	}

	function edit_entry {
		echo -n "Enter email to edit: "
		read -r email
		if grep -i "${email}" "${ADDRESSBOOK_FILE}"
		then
			echo "Editing entry:"
			grep -i "${email}" "${ADDRESSBOOK_FILE}"
			echo "Enter new values:"
			echo -n "Firstname: "
			read -r firstname
			echo -n "Lastname: "
			read -r lastname
			echo -n "Email: "
			read -r new_email
			echo -n "Phone: "
			read -r phone
			
			# Remove the existing entry
			sed -i "/${email}/d" "${ADDRESSBOOK_FILE}"
			
			# Add the edited entry
			if [ -z "${new_email}" ]
			then
				new_email="${email}"
			fi
			echo "${firstname}|${lastname}|${new_email}|${phone}" >> "${ADDRESSBOOK_FILE}"
			echo -e "\e[32mEntry edited successfully.\e[0m"
		else
			echo -e "\e[31mEntry not found.\e[0m"
		fi
	}

function main {
	while true
	do
		display_menu
		echo -n "Enter your choice: "
		echo
		read -r choice
		
		case "${choice}" in
			1) search_entries
			
			;;
			2) add_entry 
			
			;;
			3) remove_entry
			
			;;
			4) edit_entry
			
			;;
			5) echo -e "\e[34mGoodbye!\e[0m"
				exit 
			
			;;
			*) echo -e "\e[31mInvalid choice.\e[0m" 
			
			;;
		esac
	done
}

main