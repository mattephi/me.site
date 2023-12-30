# Use the official Alpine Linux image as the base image
FROM alpine:latest

# Set environment variables
ENV LANG=en_US.UTF-8 \
    LANGUAGE=en_US.UTF-8 \
    LC_ALL=en_US.UTF-8 \
    TZ=UTC

# Update package list and install necessary dependencies
RUN apk update && \
    apk add --no-cache \
    bash \
    git \
    build-base \
    ruby \
    ruby-dev \
    libffi-dev \
    nodejs \
    npm \
    yarn && \
    gem install bundler:2.2.30

RUN mkdir /app

WORKDIR /app
COPY Gemfile* /app
COPY package.json /app

RUN bundle config set path 'vendor/bundle'
RUN bundle install
RUN yarn install

RUN bundle exec jekyll build --trace

# Start the Jekyll server when the container runs
CMD ["sh", "entry.sh"]
