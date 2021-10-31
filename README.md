# Portal

This is a sample Phoenix App. It uses [Vapor](https://github.com/elixir-toniq/vapor) for config management. It's based on Phoenix 1.6.2. Use ASDF for installing correct versions of Elixir and Erlang.

The `.env` file is the template for the settings required. Add a `.env.dev.local` and `.env.test.local` file to override any of the environment variables locally for dev and test respectively.

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.
