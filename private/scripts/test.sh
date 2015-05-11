#! /bin/sh
export PATH="$TRAVIS_BUILD_DIR/vendor/bin:$TRAVIS_BUILD_DIR/cli/bin:$PATH"

# Log in, but don't output the password to Travis
echo "Authenticating into terminus"
{
  terminus auth login $PEMAIL --password=$PPASS
} &> /dev/null

terminus sites list

if [ $TRAVIS_PULL_REQUEST ] ; then
   echo "Using trav-$TRAVIS_BUILD_NUMBER for branch"
   export PENV="trav-$TRAVIS_BUILD_NUMBER"
   echo "terminus site create-env --site=$PNAME --env=$PENV --from-env=dev"
   terminus site create-env --site=$PNAME --env=$PENV --from-env=dev
   terminus site clone-env --site=$PNAME --to-env=$PENV --from-env=dev --db --files --yes
fi

echo "Set up behat ENV vars"

if [ $TRAVIS_PULL_REQUEST ] ; then
   export BASE_URL="https://trav-$TRAVIS_BUILD_NUMBER-golden-god-demo.pantheon.io/"
else
   export BASE_URL="https://dev-golden-god-demo.pantheon.io/"
fi
export BEHAT_PARAMS="context[parameters][base_url]=$BASE_URL"
export MINK_EXTENSION_PARAMS="base_url=$BASE_URL"

# export BASE_URL="https://dev-golden-god-demo.pantheon.io/"
echo "Using BASE_URL $BASE_URL"

echo "Running Behat tests"
rm -rf cli/vendor
./vendor/bin/behat
