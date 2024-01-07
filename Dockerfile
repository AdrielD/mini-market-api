FROM ruby:3.3-alpine3.19

RUN apk update && \
    apk upgrade && \
    apk add build-base tzdata postgresql-dev postgresql-client libxslt-dev libxml2-dev imagemagick

WORKDIR /app

COPY Gemfile Gemfile.lock ./

RUN gem install bundler

RUN bundle install

COPY . ./

CMD ["bundle", "exec", "rails", "s", "-b", "0.0.0.0", "-p", "3001"]
