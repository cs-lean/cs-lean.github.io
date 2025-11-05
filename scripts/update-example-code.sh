#!/bin/bash

# Updates the example code from a given Lean git revision.
#
# This script uses curl and GitHub's raw content URLs to download specific files
# Repository and file mappings are hardcoded, revision is passed as a command-line argument

# ===== CONFIGURATION =====
REPO_OWNER="leanprover"
REPO_NAME="lean4"

# File mappings format: "source_path:destination_path"
# source_path: Path to the file in the repository
# destination_path: Local path where the file should be saved
# Add or remove files as needed
FILE_MAPPINGS=(
  "doc/examples/bintree.lean:./examples/doc-overview/bintree.lean"
  "doc/examples/deBruijn.lean:./examples/doc-overview/deBruijn.lean"
  "doc/examples/interp.lean:./examples/doc-overview/interp.lean"
  "doc/examples/palindromes.lean:./examples/doc-overview/palindromes.lean"
  "doc/examples/phoas.lean:./examples/doc-overview/phoas.lean"
  "doc/examples/tc.lean:./examples/doc-overview/tc.lean"
  "doc/examples/widgets.lean:./examples/widget-docs/widgets.lean"
)
# =========================

set -e  # Exit immediately if a command exits with a non-zero status

# Function to display usage
usage() {
    echo "Usage: $0 REVISION"
    echo
    echo "Arguments:"
    echo "  REVISION   Git revision (branch, tag, or commit hash)"
    echo
    echo "Repository: $REPO_OWNER/$REPO_NAME (configured in script)"
    echo "Examples:"
    echo "  $0 master"
    echo "  $0 v4.19.0"
    exit 1
}

# Check if revision is provided
if [ $# -ne 1 ]; then
    usage
fi

REVISION="$1"

# Check if curl is available
if ! command -v curl &> /dev/null; then
    echo "Error: curl is not installed. Please install curl to use this script."
    exit 1
fi

echo "Updating example code..."
echo "Repository: $REPO_OWNER/$REPO_NAME"
echo "Revision: $REVISION"

# Set the base URL for raw GitHub content
RAW_GITHUB_URL="https://raw.githubusercontent.com/$REPO_OWNER/$REPO_NAME/$REVISION"

for mapping in "${FILE_MAPPINGS[@]}"; do
    # Split the mapping into source and destination
    source_path="${mapping%%:*}"
    dest_path="${mapping#*:}"

    # Create destination directory if it doesn't exist
    dest_dir=$(dirname "$dest_path")
    mkdir -p "$dest_dir"

    # Construct the full URL
    file_url="$RAW_GITHUB_URL/$source_path"

    # Download the file
    echo "Downloading: $source_path"
    if curl -s -f -o "$dest_path" "$file_url"; then
        echo "Saved as: $dest_path"
    else
        echo "Warning: Failed to download '$source_path' from revision '$REVISION'"
    fi
done

echo
echo "Now, please check the toolchain files and make sure they have the right versions:"
find examples -name lean-toolchain -not -path "*.lake*" -exec sh -c 'echo "$1:"; cat "$1"; echo' _ {} \;
