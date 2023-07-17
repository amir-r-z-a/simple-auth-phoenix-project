defmodule Verify.Users.User do
  use Ecto.Schema
  use Pow.Ecto.Schema, user_id_field: :number

  schema "users" do
    field :number,           :string
    field :password_hash,    :string
    field :current_password, :string, virtual: true
    field :password,         :string, virtual: true
    field :confirm_password, :string, virtual: true
    timestamps()
  end
end
