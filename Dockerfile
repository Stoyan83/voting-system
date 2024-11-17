# syntax=docker/dockerfile:1

# Use only for development
ARG RUBY_VERSION=3.3.5
FROM ruby:$RUBY_VERSION-slim

WORKDIR /app

# Install system dependencies needed to build gems, node modules, and assets
RUN apt-get update -qq && \
  apt-get install --no-install-recommends -y build-essential git libpq-dev libvips pkg-config curl gnupg2 postgresql-client nano nodejs npm

# Install Yarn
RUN curl -fsSL https://deb.nodesource.com/setup_16.x | bash - && \
  apt-get install -y nodejs && \
  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
  apt-get update -qq && apt-get install -y yarn

# This is to take advantage of Docker's cache and avoid reinstalling gems on every change
COPY Gemfile Gemfile.lock ./
RUN bundle install

# Copy yarn.lock to ensure it's available for yarn install
COPY yarn.lock ./

# Copy the rest of the application
COPY . ./

# Install foreman
RUN gem install foreman

ENTRYPOINT ["/app/bin/docker-entrypoint"]

EXPOSE 3000
CMD ["bin/rails", "server", "-b", "0.0.0.0"]
