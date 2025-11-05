#!/bin/bash

for outer in blog-examples examples; do
    for d in $outer/*; do
        [ -d "$d" ] || continue
        pushd "$d" || continue
        lake --keep-toolchain update subverso || lake update subverso
        lake clean
        lake build :examples
        popd
    done
done
