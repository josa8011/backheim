FROM ruby:2.6.4

RUN apt-get update
RUN apt-get install -y nodejs
RUN mkdir /home/backheim/ 
WORKDIR /home/backheim/
COPY Gemfile Gemfile.lock ./
RUN gem install bundler
# By adding and installing just the Gemfiles first docker can use cache for bundle install when building even if other files have changed
RUN bundle update
RUN bundle install
COPY . .
CMD bin/rails server