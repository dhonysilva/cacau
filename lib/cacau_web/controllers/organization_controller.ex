defmodule CacauWeb.OrganizationController do
  use CacauWeb, :controller

  alias Hex.API.Key.Organization
  alias Cacau.Accounts
  alias Cacau.Accounts.Organization

  def index(conn, _params) do
    user = conn.assigns[:current_user]
    organizations = Accounts.list_organizations(user)
    render(conn, :index, organizations: organizations)
  end

  def new(conn, _params) do
    changeset = Accounts.change_organization(%Organization{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"organization" => organization_params}) do
    user = conn.assigns[:current_user]

    case Accounts.create_organization(user, organization_params) do
      {:ok, %{organization: organization}} ->
        conn
        |> put_flash(:info, "Organization created successfully.")
        |> redirect(to: ~p"/organizations/#{organization}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    organization =
      id
      |> Accounts.get_organization!()

    render(conn, :show, organization: organization)
  end

  def edit(conn, %{"id" => id}) do
    organization = Accounts.get_organization!(id)
    changeset = Accounts.change_organization(organization)
    render(conn, :edit, organization: organization, changeset: changeset)
  end

  def update(conn, %{"id" => id, "organization" => organization_params}) do
    organization = Accounts.get_organization!(id)

    case Accounts.update_organization(organization, organization_params) do
      {:ok, organization} ->
        conn
        |> put_flash(:info, "Organization updated successfully.")
        |> redirect(to: ~p"/organizations/#{organization}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, organization: organization, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    organization = Accounts.get_organization!(id)
    {:ok, _organization} = Accounts.delete_organization(organization)

    conn
    |> put_flash(:info, "Organization deleted successfully.")
    |> redirect(to: ~p"/organizations")
  end
end
