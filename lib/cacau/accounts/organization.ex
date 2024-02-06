defmodule Cacau.Accounts.Organization do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  schema "organizations" do
    field :name, :string

    many_to_many :members, Cacau.Accounts.User, join_through: Cacau.Accounts.Membership
    has_many :memberships, Cacau.Accounts.Membership
    has_one :ownership, Cacau.Accounts.Membership, where: [role: :owner]
    has_one :owner, through: [:ownership, :user]

    timestamps()
  end

  def new(params), do: changeset(%__MODULE__{}, params)

  @doc false
  def changeset(organization, attrs) do
    organization
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
