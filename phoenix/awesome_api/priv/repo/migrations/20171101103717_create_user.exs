defmodule AwesomeApi.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :username, :string
      add :age, :integer
      add :email, :string

      timestamps()
    end
  end
end
