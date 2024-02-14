defmodule Cacau.Catalog.Category do
  use Ecto.Schema
  import Ecto.Changeset

  alias Cacau.Catalog.Product

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "categories" do
    field :title, :string

    embeds_many :products, Product

    timestamps()
  end

  @doc false
  def changeset(category, attrs) do
    category
    |> cast(attrs, [:title])
    |> validate_required([:title])
    |> unique_constraint(:title)
  end
end
