#!/bin/bash

# This script finds all lean-toolchain files and installs their Lean
# versions, to avoid race conditions from having Elan do it as needed
# during a parallel build. It's used in CI.

find . -type f -name "lean-toolchain" -not -path "*/\.lake/*" | while read -r file; do
    version=$(sed 's/^[[:space:]]*//;s/[[:space:]]*$//' "$file")
    elan toolchain install "$version"
done
