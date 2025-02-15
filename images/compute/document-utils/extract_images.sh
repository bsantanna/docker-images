#!/bin/bash

# Check if poppler-utils is installed
if ! command -v pdftoppm &> /dev/null
then
    echo "poppler-utils (pdftoppm) could not be found. Please install it."
    exit 1
fi

extract_images() {
    local pdf_file="$1"
    local pdf_path=$(dirname "$(readlink -f "$pdf_file")")
    local pdf_name=$(basename "$pdf_file" .pdf)
    
    # Extract images, setting max resolution to 1024x768 and saving as JPG
    # pdftoppm -jpeg -r 72 -scale-to-x 1024 -scale-to-y 768 "$pdf_file" "$pdf_path/$pdf_name-page"
    pdftoppm -jpeg -r 72 "$pdf_file" "$pdf_path/$pdf_name-page"

    echo "Extracted images from $pdf_file to $pdf_path"
}

# Read input from stdin
while IFS= read -r file; do
    if [ -f "$file" ]; then
        case "$file" in
            *.pdf)
                extract_images "$file"
                ;;
            *)
                echo "Skipping $file: not a PDF file."
                ;;
        esac
    else
        echo "File not found: $file"
    fi
done