defmodule Mello.TaskFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Mello.Task` context.
  """

  @doc """
  Generate a list.
  """

  def card_fixture(attrs \\ %{}) do
    {:ok, card} =
      attrs
      |> Enum.into(%{
        details: "some details",
        title: "some title"
      })
      |> Mello.Task.create_card()

    card
  end
end
