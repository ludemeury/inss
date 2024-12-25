FROM ruby:3.3.6-alpine

ENV APP_PATH=/usr/src/app

RUN apk add --no-cache \
    build-base \
    curl \
    git \
    nodejs \
    npm \
    postgresql-dev \
    tzdata \
    && npm install -g yarn

WORKDIR $APP_PATH

COPY Gemfile Gemfile.lock ./

RUN bundle install

COPY package.json yarn.lock ./
RUN yarn install --frozen-lockfile

COPY . .

RUN chmod +x ./entrypoint.sh

EXPOSE 3000

ENTRYPOINT ["/bin/sh", "entrypoint.sh"]
