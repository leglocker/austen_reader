#!/bin/bash

BOOK_NAME_FILE="./book_name_file.txt"

# Read state
AUSTEN_TXT=$(sed -n '1p' "$BOOK_NAME_FILE")
line=$(sed -n '2p' "$BOOK_NAME_FILE")

LINES_TO_PRINT=5

count=0
while [ $count -lt $LINES_TO_PRINT ]
do
sed -n "${line}p" "$AUSTEN_TXT"
line=$((line + 1))
count=$((count + 1))
done

# Save updated state
echo "$AUSTEN_TXT" > "$BOOK_NAME_FILE"
echo "$line" >> "$BOOK_NAME_FILE"
