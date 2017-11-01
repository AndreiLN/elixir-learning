defmodule AwesomeApi.UserTest do
  use AwesomeApi.ModelCase

  alias AwesomeApi.User

  @valid_attrs %{age: 42, email: "some email", username: "some username"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = User.changeset(%User{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = User.changeset(%User{}, @invalid_attrs)
    refute changeset.valid?
  end
end
