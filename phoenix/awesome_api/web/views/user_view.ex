defmodule AwesomeApi.UserView do
  use AwesomeApi.Web, :view

  def render("index.json", %{users: users}) do
    %{data: render_many(users, AwesomeApi.UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, AwesomeApi.UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{id: user.id,
      username: user.username,
      age: user.age,
      email: user.email}
  end
end
