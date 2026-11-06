#!/bin/bash

# Check if LibreOffice is installed
if ! command -v libreoffice &> /dev/null
then
    echo "LibreOffice could not be found. Please install it."
    exit 1
fi

convert_to_pdf() {
    local file="$1"
    local filename=$(basename "$file")
    local basename="${filename%.*}"
    local outdir=$(dirname "$(readlink -f "$file")")
    local profile
    profile=$(mktemp -d)
    
    # Convert the file to PDF with an isolated LibreOffice profile
    libreoffice --headless -env:UserInstallation="file://$profile" --convert-to pdf "$file" --outdir "$outdir"
    rm -rf "$profile"
    
    echo "Converted $file to $basename.pdf"
}

# Read input from stdin
while IFS= read -r file; do
    if [ -f "$file" ]; then
        case "$file" in
            *.pptx|*.docx)
                convert_to_pdf "$file"
                ;;
            *)
                echo "Skipping $file: not a supported file type."
                ;;
        esac
    else
        echo "File not found: $file"
    fi
done