FROM ruby:3.1.1-alpine3.15

RUN apk add --update build-base bash bash-completion libffi-dev tzdata postgresql-client postgresql-dev nodejs npm yarn
WORKDIR /webapp
COPY Gemfile /webapp/Gemfile
RUN gem install bundler
RUN gem uninstall nokogiri
RUN bundle config set force_ruby_platform true
RUN bundle install
RUN cd /webapp && bundle install

COPY . .
EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]