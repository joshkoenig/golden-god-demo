
if [ $TRAVIS_PULL_REQUEST ] ; then
   echo "Using trav-$TRAVIS_BUILD_NUMBER for branch"
   export PENV="trav-$TRAVIS_BUILD_NUMBER"
   echo "terminus site delete-env --site=$PNAME --env=$PENV --yes"
   terminus site delete-env --site=$PNAME --env=$PENV --yes
fi