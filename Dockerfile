# syntax=docker/dockerfile:1
FROM ruby:2.7.8
RUN apt-get update -qq && apt-get install -y nodejs
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

RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

EXPOSE 3000

# Configure the main process to run when running the image
CMD ["rails", "server", "-b", "0.0.0.0"]