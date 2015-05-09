#! /bin/sh
echo "Set up behat ENV vars"
export BEHAT_PARAMS="context[parameters][base_url]=$BASE_URL"
export PATH="$TRAVIS_BUILD_DIR/vendor/bin:$PATH"

behat
