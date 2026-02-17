#!/bin/bash

# Define the path to your text file
LINE_TRACKER_FILE="./line_tracker.txt"
AUSTEN_TXT="./pride_and_prejudice.txt"


# Read the first line of the file into a variable
# Use < "$FILE" to redirect the file content to the read command
read -r line < "$LINE_TRACKER_FILE"

p="p"
sed -n $line$p  $AUSTEN_TXT
line=$((line + 1))
sed -n $line$p  $AUSTEN_TXT
line=$((line + 1))
sed -n $line$p  $AUSTEN_TXT
line=$((line + 1))
sed -n $line$p  $AUSTEN_TXT
line=$((line + 1))
sed -n $line$p  $AUSTEN_TXT
line=$((line + 1))


# Write the new number back to the file
echo "$line" > "$LINE_TRACKER_FILE"
