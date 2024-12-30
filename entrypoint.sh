#!/bin/sh

set -e

# Run database setup if needed
if [ "$RAILS_ENV" != "production" ]; then
  bundle exec rails assets:precompile
  echo "Running migrations..."
  bundle exec rails db:prepare
fi

# Execute the passed commands
exec "$@"
