defmodule Verify.Repo do
  use Ecto.Repo,
    otp_app: :verify,
    adapter: Ecto.Adapters.Postgres
end
