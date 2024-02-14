defmodule CacauWeb.CategoryHTML do
  use CacauWeb, :html

  embed_templates "category_html/*"

  @doc """
  Renders a category form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def category_form(assigns)

  def product_opts(changeset) do
    existing_ids =
      changeset
      |> Ecto.Changeset.get_change(:products, [])
      |> Enum.map(& &1.data.id)

    for prod <- Cacau.Catalog.list_products(),
        do: [key: prod.name, value: prod.id, selected: prod.id in existing_ids]
  end
end
