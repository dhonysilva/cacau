defmodule Cacau.LinksFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Cacau.Links` context.
  """

  @doc """
  Generate a link.
  """
  def link_fixture(attrs \\ %{}) do
    {:ok, link} =
      attrs
      |> Enum.into(%{
        url: "some url",
        visits: 42
      })
      |> Cacau.Links.create_link()

    link
  end
end
