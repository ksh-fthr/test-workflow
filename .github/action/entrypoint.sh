#!/bin/sh

cd "$GITHUB_WORKSPACE"

export GITHUB_TOKEN=${INPUT_GITHUB_TOKEN}

if [ ${INPUT_DRY_RUN} = 'true' ] ; then
  github-labeler -manifest ${INPUT_MANIFEST} -dry-run > results.txt
  RUN_RESULT=$?
else
  github-labeler -manifest ${INPUT_MANIFEST} > results.txt
  RUN_RESULT=$?
fi

echo ''
echo '## RESULTS ##################################'
cat results.txt

exit ${RUN_RESULT}
