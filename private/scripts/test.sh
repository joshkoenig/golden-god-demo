#! /bin/sh
echo "Set up behat ENV vars"

echo "testing vars: $TRAVIS_PULL_REQUEST"
echo $TRAVIS_PULL_REQUEST

echo "testing vars: ${TRAVIS_PULL_REQUEST}"
echo ${TRAVIS_PULL_REQUEST}

export BEHAT_PARAMS="context[parameters][base_url]=$BASE_URL"
export PATH="$TRAVIS_BUILD_DIR/vendor/bin:$PATH"

echo "Running Behat tests"
# behat
