#! /bin/sh
echo "Set up the target environment"
composer self-update
composer install

echo "Install terminus directly"
curl https://github.com/pantheon-systems/cli/releases/download/0.5.5/terminus.phar -L -o terminus
chmod +x terminus

export PATH="$TRAVIS_BUILD_DIR/vendor/bin:$PATH"
# Log in, but don't output the password to Travis
echo "Authenticating into terminus"
{
  ./terminus auth login $PEMAIL --password=$PPASS
} &> /dev/null

./terminus sites list

if [ $TRAVIS_PULL_REQUEST ] ; then
   echo "Using trav-$TRAVIS_BUILD_NUMBER for branch"
   export PENV="trav-$TRAVIS_BUILD_NUMBER"
   echo "./terminus site create-env --site=$PNAME --env=$PENV"
   ./terminus site create-env --site=$PNAME --env=$PENV
fi