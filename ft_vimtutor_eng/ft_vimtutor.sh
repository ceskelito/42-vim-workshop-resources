#!/bin/bash

# AI GENERATED CONTENT

# Name of the original file created for the workshop
SOURCE_FILE="ft_vimtutor.txt"

# 1. Check if the source file exists in the current directory
if [ ! -f "$SOURCE_FILE" ]; then
    echo "Error: The file '$SOURCE_FILE' was not found."
    echo "Make sure the script is in the same folder as the tutorial."
    exit 1
fi

# 2. Create a safe temporary file in /tmp/
# The .txt extension ensures Vim loads syntax plugins correctly
TEMP_TUTOR=$(mktemp /tmp/workshop_vim.XXXXXX.txt)

# 3. Set a 'trap' to automatically delete the temporary file
# when the script exits (even if abruptly interrupted)
trap "rm -f $TEMP_TUTOR" EXIT

# 4. Copy the original content into the temporary file
cp "$SOURCE_FILE" "$TEMP_TUTOR"

# 5. Open the temporary file with Vim
# Once the Vim session ends, the script will resume execution
vim "$TEMP_TUTOR"

echo "Session ended. The temporary file has been removed successfully."
