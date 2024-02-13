# mix phx.gen.html Links Link links url:string visits:integer organization_id:references:organizations
defmodule Cacau.Repo.Migrations.CreateLinks do
  use Ecto.Migration

  def change do
    create table(:links, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :url, :string
      add :visits, :integer
      add :organization_id, references(:organizations, on_delete: :nothing, type: :binary_id)

      timestamps()
    end

    create index(:links, [:organization_id])
  end
end
