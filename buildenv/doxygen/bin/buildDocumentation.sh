#!/bin/bash

# Exit if a command fails, undefined vars are encountered, and preserve fails in pipes
set -euo pipefail

makeTarget=${1:-"doc_doxygen"}
repoPath=${2:-"AutoPas"}
buildDir="docker-build-doxygen"

cd "${repoPath}"
rm -rf "${buildDir}"
mkdir "${buildDir}" && cd $_

# create doxygen target
cmake -DAUTOPAS_BUILD_TARGET_DOC=ON -DAUTOPAS_BUILD_EXAMPLES=ON ..

# Run make to build the doc. Pipe stderr through a subprocess which saves it to warnings.out.
make "${makeTarget}" 2> >(tee warnings.out >&2)

# Print all warnings collected previously. Exit code depends on number of warnings.
numWarnings=$(wc -l warnings.out | cut -d' ' -f1)
if [[ "$numWarnings" -gt 0 ]]; then
    echo "------------- WARNINGS -------------"
    cat warnings.out && exit ${numWarnings}
fi
