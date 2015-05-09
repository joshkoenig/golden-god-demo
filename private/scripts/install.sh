#! /bin/sh
echo "Set up the target environment"
composer install

export PATH="$TRAVIS_BUILD_DIR/vendor/bin:$PATH"
# Log in, but don't output the password to Travis
echo "Authenticating into terminus"
{
  terminus auth login $PEMAIL --password=$PPASS
} &> /dev/null

terminus sites list