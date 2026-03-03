#!/bin/bash

# Define the directory to start searching from and the file extension
SEARCH_DIR="./books"
FILE_EXT="*.txt"

# Store the full paths of matching files in an array named 'pdf_files'
# The -type f option ensures only regular files are matched
my_list_untrimmed=($(find "$SEARCH_DIR" -type f -name "$FILE_EXT"))

# Initialize an empty array
my_list=()


# Loop through the items and add a prefix before appending to the list
for item in "${my_list_untrimmed[@]}"; do
    filename=$(basename -s '.txt' "$item")
    my_list+=("$filename")
done





# Function to display a dynamic menu
dynamic_menu() {
    local options=("$@")
    local selected_option # Variable to store the selected option

    # Set the prompt for the select command
    PS3="Please enter a number to select an option, or 'q' to quit: "

    # Start the select loop
    select choice in "${options[@]}"; do
        case $choice in
            "Quit")
                echo "Exiting script."
                break
                ;;
            *)
                if [[ -n "$choice" ]]; then
                    selected_option="$choice"
                    echo "You selected: $selected_option"
                    # Add commands here to perform actions based on the selection
                    break
                else
                    # Handle invalid input
                    echo "Invalid selection. Please enter a number from 1 to ${#options[@]} or 'q' to quit."
                    # The select loop automatically redisplays the menu for invalid input if we do not 'break' or 'continue'
                fi
                ;;
        esac
    done
}

# --- Example Usage ---


# 2. Call the function with the list as arguments
echo "--- Dynamic Menu Demo ---"
dynamic_menu "${my_list[@]}"




###select mode####


# 2. Call the function with the list as arguments


# Initialize an empty array
my_mode=("RESTART/BEGIN" "CONTINUE")


echo "--- Dynamic Menu Demo ---"
dynamic_menu "${my_mode[@]}"




# 3. The function will return after a valid selection (or quit), and you can continue with the script
echo "Script finished."

