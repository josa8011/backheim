FROM ruby:2.6.4

RUN apt-get update
RUN apt-get install -y nodejs
RUN mkdir /home/mrdb/ 
WORKDIR /home/mrdb/
COPY Gemfile Gemfile.lock ./
RUN gem install bundler
# By adding and installing just the Gemfiles first docker can use cache for bundle install when building even if other files have changed
RUN bundle install
COPY . .
CMD bundle exec puma -p 3000