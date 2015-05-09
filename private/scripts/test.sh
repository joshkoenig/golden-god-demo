#! /bin/sh
echo "Set up behat ENV vars"

if [ $TRAVIS_PULL_REQUEST ] ; then
   export BASE_URL="https://trav-$TRAVIS_BUILD_NUMBER-golden-god-demo.pantheon.io/"
else
   export BASE_URL="https://dev-golden-god-demo.pantheon.io/"
fi
echo "Using BASE_URL $BASE_URL"

export BEHAT_PARAMS="context[parameters][base_url]=$BASE_URL"
export PATH="$TRAVIS_BUILD_DIR/vendor/bin:$PATH"

echo "Running Behat tests"
behat
