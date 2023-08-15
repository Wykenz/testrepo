#!/bin/bash

#!/bin/bash

YES_ACCENTS="íÍúÚüÜőŐöÖóÓüÜéÉáÁ"
NO_ACCENTS="iIuUuUoOoOoOuUeEaA"
remove_accents_tr() {
    local text="$1"
    echo "$text" | tr $YES_ACCENTS $NO_ACCENTS 
}

read -p "Enter a word with accented characters: " input_word
output_word=$(remove_accents_tr ${input_word})

echo "Input: $input_word"
echo "Output: $output_word"
