defmodule Cacau.Links.Link do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "links" do
    field :url, :string
    field :visits, :integer
    # field :organization_id, :binary_id
    belongs_to :organization, Cacau.Accounts.Organization

    timestamps()
  end

  @doc false
  def changeset(link, attrs) do
    link
    |> cast(attrs, [:url, :visits, :organization_id])
    |> validate_required([:url, :visits])
  end
end
