#! /bin/sh
echo "Set up the target environment"
composer self-update
composer install

echo "Install terminus directly"
curl https://github.com/pantheon-systems/cli/releases/download/0.5.5/terminus.phar -L -o /usr/local/bin/terminus 
chmod +x /usr/local/bin/terminus

export PATH="$TRAVIS_BUILD_DIR/vendor/bin:$PATH"
# Log in, but don't output the password to Travis
echo "Authenticating into terminus"
{
  terminus auth login $PEMAIL --password=$PPASS
} &> /dev/null

terminus sites list