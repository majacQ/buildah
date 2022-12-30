#!/bin/bash

set -e

REPO_ROOT=`realpath $(dirname $0)/../../`
TOOL_DIR="$REPO_ROOT/tests/tools/build"

export PATH="$TOOL_DIR:$PATH"
if [[ -z "$(type -P git-validation)" ]]; then
	echo git-validation is not in PATH "$PATH".
	exit 1
fi

  <<<<<<< release-1.17
GITVALIDATE_EPOCH="${GITVALIDATE_EPOCH:-8891d05dbaffc0b6013a48a68177b4ccec281f8c}"
  =======
GITVALIDATE_EPOCH="${GITVALIDATE_EPOCH:-e6ea308d6de1724a0ead3e08517a5e365461b275}"
  >>>>>>> release-1.22

OUTPUT_OPTIONS="-q"
if [[ "$CI" == 'true' ]]; then
    OUTPUT_OPTIONS="-v"
fi

set -x
exec git-validation \
    $OUTPUT_OPTIONS \
    -run DCO,short-subject \
    ${GITVALIDATE_EPOCH:+-range "${GITVALIDATE_EPOCH}..${GITVALIDATE_TIP:-HEAD}"} \
    ${GITVALIDATE_FLAGS}
