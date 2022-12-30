#!/bin/bash

set -e

REPO_ROOT=`realpath $(dirname $0)/../../`
TOOL_DIR="$REPO_ROOT/tests/tools/build"

export PATH="$TOOL_DIR:$PATH"
if [[ -z "$(type -P git-validation)" ]]; then
	echo git-validation is not in PATH "$PATH".
	exit 1
fi

  <<<<<<< release-1.20
GITVALIDATE_EPOCH="${GITVALIDATE_EPOCH:-99f733350dcc0d1d411f656005f8a390f0e1f3bb}"
  =======
GITVALIDATE_EPOCH="${GITVALIDATE_EPOCH:-5e3515c5b09fe706d32bd4443800a996138516b2}"
  >>>>>>> release-1.21

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
