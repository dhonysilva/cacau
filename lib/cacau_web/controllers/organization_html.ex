defmodule CacauWeb.OrganizationHTML do
  use CacauWeb, :html

  embed_templates "organization_html/*"

  @doc """
  Renders a organization form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def organization_form(assigns)

  def link_opts(changeset) do
    existing_ids =
      changeset
      |> Ecto.Changeset.get_change(:links, [])
      |> Enum.map(& &1.data.id)

    for link <- Cacau.Links.list_links(),
        do: [key: link.url, value: link.id, selected: link.id in existing_ids]
  end
end
