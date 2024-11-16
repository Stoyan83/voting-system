# syntax=docker/dockerfile:1

# Make sure RUBY_VERSION matches the Ruby version in .ruby-version and Gemfile
ARG RUBY_VERSION=3.3.5
FROM ruby:$RUBY_VERSION-slim

# Set up working directory
WORKDIR /app

# Install system dependencies needed to build gems, node modules, and assets
RUN apt-get update -qq && \
  apt-get install --no-install-recommends -y build-essential git libpq-dev libvips pkg-config curl gnupg2 postgresql-client nano nodejs npm

# Install yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
  apt-get update -qq && apt-get install yarn

# This is to take advantage of Docker's cache and avoid reinstalling gems on every change
COPY Gemfile Gemfile.lock ./ 

# Install Ruby gems
RUN bundle install

COPY . .

RUN yarn install

RUN gem install foreman

ENTRYPOINT ["/app/bin/docker-entrypoint"]

EXPOSE 3000
CMD ["bin/rails", "server", "-b", "0.0.0.0"]
