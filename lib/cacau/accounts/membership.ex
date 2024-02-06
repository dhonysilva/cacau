defmodule Cacau.Accounts.Membership do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  schema "organization_memberships" do
    field :role, Ecto.Enum, values: [:owner, :admin, :viewer]

    belongs_to :user, Cacau.Accounts.User
    belongs_to :organization, Cacau.Accounts.Organization

    timestamps()
  end

  @doc false
  def changeset(membership, attrs) do
    membership
    |> cast(attrs, [:role, :user_id, :organization_id])
    |> validate_required([:role, :user_id, :organization_id])
  end

  def new(organization, user) do
    %__MODULE__{}
    |> change()
    |> put_assoc(:organization, organization)
    |> put_assoc(:user, user)
  end
end
