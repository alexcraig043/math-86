#!/bin/bash

# Check if a parameter was passed to the script
if [ -z "$1" ]; then
    echo "Usage: $0 BASENAME"
    exit 1
fi

BASENAME=$1
HOMEDIR="../homeworks"
FILENAME="$HOMEDIR/$BASENAME.ipynb"
OUTPUT="$HOMEDIR/$BASENAME.pdf"

# Check if the file exists
if [ ! -f "$FILENAME" ]; then
    echo "Error: $FILENAME does not exist."
    exit 1
fi

# Use pandoc to convert the notebook to a PDF
pandoc -s "$FILENAME" -V geometry:margin=0.5in -o "$OUTPUT"

# Check if the operation was successful
if [ $? -eq 0 ]; then
    echo "PDF has been successfully generated as $OUTPUT"
else
    echo "An error occurred while generating the PDF"
fi
