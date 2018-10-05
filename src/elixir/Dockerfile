FROM elixir:1.7.1

WORKDIR /app
COPY . .
RUN mix local.hex --force && \
  mix local.rebar --force && \
  mix deps.get
