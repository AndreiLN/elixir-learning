defmodule AwesomeApi.User do
  use AwesomeApi.Web, :model

  schema "users" do
    field :username, :string
    field :age, :integer
    field :email, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:username, :age, :email])
    |> validate_required([:username, :age, :email])
  end
end
