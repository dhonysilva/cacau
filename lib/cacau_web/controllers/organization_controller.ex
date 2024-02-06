defmodule CacauWeb.OrganizationController do
  use CacauWeb, :controller

  alias Hex.API.Key.Organization
  alias Cacau.Accounts
  alias Cacau.Accounts.Organization

  def index(conn, _params) do
    organizations = Accounts.list_organizations()
    render(conn, :index, organizations: organizations)
  end

  def new(conn, _params) do
    changeset = Accounts.change_organization(%Organization{})
    render(conn, :new, changeset: changeset)
  end

  # def create(conn, %{"category" => category_params}) do
  #   case Catalog.create_category(category_params) do
  #     {:ok, category} ->
  #       conn
  #       |> put_flash(:info, "Category created successfully.")
  #       |> redirect(to: ~p"/categories/#{category}")

  #     {:error, %Ecto.Changeset{} = changeset} ->
  #       render(conn, :new, changeset: changeset)
  #   end
  # end

  def show(conn, %{"id" => id}) do
    organization =
      id
      |> Accounts.get_organization!()

    render(conn, :show, organization: organization)
  end

  # def edit(conn, %{"id" => id}) do
  #   category = Catalog.get_category!(id)
  #   changeset = Catalog.change_category(category)
  #   render(conn, :edit, category: category, changeset: changeset)
  # end

  # def update(conn, %{"id" => id, "category" => category_params}) do
  #   category = Catalog.get_category!(id)

  #   case Catalog.update_category(category, category_params) do
  #     {:ok, category} ->
  #       conn
  #       |> put_flash(:info, "Category updated successfully.")
  #       |> redirect(to: ~p"/categories/#{category}")

  #     {:error, %Ecto.Changeset{} = changeset} ->
  #       render(conn, :edit, category: category, changeset: changeset)
  #   end
  # end

  # def delete(conn, %{"id" => id}) do
  #   category = Catalog.get_category!(id)
  #   {:ok, _category} = Catalog.delete_category(category)

  #   conn
  #   |> put_flash(:info, "Category deleted successfully.")
  #   |> redirect(to: ~p"/categories")
  # end
end
