defmodule Portal.Config do
  @moduledoc """
  Vapor module to read environment variables
  """
  use Vapor.Planner

  dotenv()

  config :db,
         env([
           {:url, "DATABASE_URL"},
           {:pool_size, "DB_POOL_SIZE", default: 10, map: &String.to_integer/1},
           {:enable_ssl, "DB_ENABLE_SSL",
            default: false, map: fn x -> if x == "true", do: true, else: false end},
           {:cert_file_path, "DB_CERT_FILE_PATH"}
         ])

  config :web,
         env([
           {:port, "PORT", default: 4000, map: &String.to_integer/1},
           {:secret_key_base, "SECRET_KEY_BASE"}
         ])
end
