FROM ruby:3.2

RUN apt-get update && apt-get install -y build-essential nodejs && rm -rf /var/lib/apt/lists/*

RUN gem install bundler jekyll

WORKDIR /usr/src/app

COPY Gemfile* ./
RUN if [ -f Gemfile ]; then bundle install; fi

COPY . .

EXPOSE 4000

CMD ["bundle", "exec", "jekyll", "serve", "--host=0.0.0.0"]
