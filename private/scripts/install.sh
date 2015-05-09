#! /bin/sh
echo "Set up the target environment"

# Log in, but don't output the password to Travis
echo "Authenticating into terminus"
{
  terminus auth login $PEMAIL --password=$PPASS
} &> /dev/null

terminus sites list