defmodule Mello.Fixtures do
  # alias Mello.Accounts.User

  @valid_attrs %{name: "Some name"}

  @create_list_attrs %{name: "Some list name"}
  @create_user_attrs %{username: "some username"}

  def list_fixture(attrs \\ %{}) do
    user =
      case Elixir.List.last(Mello.Accounts.list_users()) do
        nil -> user_fixture(@create_user_attrs)
        existing_user -> existing_user
      end
    {:ok, list} =
      attrs
      |> Map.put(:user_id, user.id)
      |> Enum.into(@create_list_attrs)
      |> Mello.Task.create_list()

    list
  end

  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(@create_user_attrs)
      |> Mello.Accounts.create_user()

    user
  end

  def create_user(_) do
    user = user_fixture(@valid_attrs)
    {:ok, user: user}
  end

  def create_list(_) do
    list = user_fixture(@create_list_attrs)
    {:ok, list: list}
  end
end
