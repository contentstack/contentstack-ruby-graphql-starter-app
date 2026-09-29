# syntax=docker/dockerfile:1
FROM ruby:4.0.0-alpine3.22
# Update all packages to fix security vulnerabilities
RUN apk update && apk upgrade \
    && apk add --no-cache \
    nodejs \
    build-base \
    pkgconfig \
    linux-headers \
    && rm -rf /var/cache/apk/*
# Create a non-root user and group
RUN addgroup -S appuser && adduser -S -G appuser appuser
WORKDIR /app
COPY Gemfile .
COPY Gemfile.lock .
RUN gem install bundler:2.3.13
RUN bundle install
RUN bundle update
COPY . .
# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/

COPY ngnix.conf /etc/nginx/nginx.conf
ENV RAILS_ENV=development

RUN chmod +x /usr/bin/entrypoint.sh
# Switch to the non-root user before running commands
USER appuser
ENTRYPOINT ["entrypoint.sh"]

EXPOSE 3000

# Main process
CMD ["rails", "server", "-e", "development", "-b", "0.0.0.0"]