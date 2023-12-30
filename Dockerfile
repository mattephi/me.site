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
    gem install bundler:2.2.30 && \
    mkdir /app

# Set the working directory in the container
WORKDIR /app

# Copy your Jekyll project files to the container
COPY . .

# Install Jekyll and its dependencies
RUN bundle config set path 'vendor/bundle' && \
    bundle install

# Install Node.js dependencies using Yarn
RUN yarn install
RUN export JEKYLL_ENV=development jekyll build
# Build the Jekyll site
RUN bundle exec jekyll build --trace

# Expose port 4000 for Jekyll serve
EXPOSE 4000

# Start the Jekyll server when the container runs
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]
