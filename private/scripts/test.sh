#! /bin/sh
echo "Set up behat ENV vars"
printenv

if [ $TRAVIS_PULL_REQUEST ] ; then
   echo "Need to generate the md name here..."
else
   export BASE_URL="https://dev-golden-god-demo.pantheon.io/"
fi

echo "testing vars: ${TRAVIS_PULL_REQUEST}"
echo ${TRAVIS_PULL_REQUEST}

export BEHAT_PARAMS="context[parameters][base_url]=$BASE_URL"
export PATH="$TRAVIS_BUILD_DIR/vendor/bin:$PATH"

echo "Running Behat tests"
# behat
