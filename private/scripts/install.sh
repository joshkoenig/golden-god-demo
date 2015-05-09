#! /bin/sh
echo "Run Composer"
composer self-update
composer install

echo "Install terminus directly"
git clone https://github.com/pantheon-systems/cli.git
cd cli
git checkout ci-demo
composer install
chmod + $TRAVIS_BUILD_DIR/cli/bin/terminus