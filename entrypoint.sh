#!/bin/sh

set -e

if [ "$RAILS_ENV" != "production" ]; then
  echo "Running migrations..."
  bundle install
fi

exec "$@"
