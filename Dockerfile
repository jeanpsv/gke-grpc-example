FROM ruby:2.5.1

WORKDIR /app
COPY . .
RUN gem install grpc grpc-tools
