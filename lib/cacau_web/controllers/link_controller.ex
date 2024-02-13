defmodule CacauWeb.LinkController do
  use CacauWeb, :controller

  alias Cacau.Repo
  alias Cacau.Links
  alias Cacau.Links.Link

  def index(conn, _params) do
    links = Links.list_links()
    render(conn, :index, links: links)
  end

  def new(conn, _params) do
    # IO.inspect(conn, label: "Passando no new")
    changeset = Links.change_link(%Link{})
    render(conn, :new, changeset: changeset)
  end

  # To-do:
  # Inserir o parametro da Organization

  def create(conn, %{"link" => link_params, "organization_id" => organization_id}) do
    IO.inspect(link_params, label: "Passando no create")
    organization = Repo.get(Organization, organization_id)

    case Links.create_link(organization, link_params) do
      {:ok, link} ->
        conn
        |> put_flash(:info, "Link created successfully.")
        |> redirect(to: ~p"/links/#{link}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    link = Links.get_link!(id)
    render(conn, :show, link: link)
  end

  def edit(conn, %{"id" => id}) do
    link = Links.get_link!(id)
    changeset = Links.change_link(link)
    render(conn, :edit, link: link, changeset: changeset)
  end

  def update(conn, %{"id" => id, "link" => link_params}) do
    link = Links.get_link!(id)

    case Links.update_link(link, link_params) do
      {:ok, link} ->
        conn
        |> put_flash(:info, "Link updated successfully.")
        |> redirect(to: ~p"/links/#{link}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, link: link, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    link = Links.get_link!(id)
    {:ok, _link} = Links.delete_link(link)

    conn
    |> put_flash(:info, "Link deleted successfully.")
    |> redirect(to: ~p"/links")
  end
end
