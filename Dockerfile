FROM ruby:2.4.1-onbuild
MAINTAINER Colin Morelli <colin@parakeet.is>
VOLUME /usr/src/app/source

RUN apt-get update && apt-get install -y nodejs && apt-get clean && rm -rf /var/lib/apt/lists/*

CMD ["bundle", "exec", "middleman", "build", "--clean"]