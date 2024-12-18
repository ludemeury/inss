# Use Ruby 3.3.6 alpine base image
FROM ruby:3.3.6-alpine

# Set environment variables
ENV APP_PATH=/usr/src/app

# Install essential packages, build tools, and dependencies for Rails
RUN apk add --no-cache \
    build-base \
    curl \
    git \
    nodejs \
    npm \
    postgresql-dev \
    tzdata \
    && npm install -g yarn

# Set the working directory
WORKDIR $APP_PATH

# Copy Gemfile and Gemfile.lock before other files for Docker cache efficiency
COPY Gemfile Gemfile.lock ./

# Install gems
RUN bundle install

# Copy application source code
COPY . .

# Set permissions for the entrypoint script
RUN chmod +x ./entrypoint.sh

# Expose the default Rails server port
EXPOSE 3000

# Set entrypoint script
ENTRYPOINT ["/bin/sh", "entrypoint.sh"]
