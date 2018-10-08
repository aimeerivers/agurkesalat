# Start med Ruby 2.5.1
FROM ruby:2.5.1

# Sæt en arbejdsmappe
WORKDIR /arbejde

# Install nødvendige gems
COPY Gemfile* ./
RUN bundle config --global frozen 1
RUN gem update bundler
RUN bundle install

# Kopi cucumber features til containeren
COPY ./features ./features

# Skab nye mapper
RUN mkdir -p /arbjede/skaermbilleder

# Kør cucumber tests
CMD bundle exec cucumber
