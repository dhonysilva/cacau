defmodule Cacau.Accounts.Membership do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "organization_memberships" do
    field :role, Ecto.Enum, values: [:owner, :admin, :viewer]
    field :user_id, :binary_id
    field :organization_id, :binary_id

    timestamps()
  end

  @doc false
  def changeset(membership, attrs) do
    membership
    |> cast(attrs, [:role])
    |> validate_required([:role])
  end
end
