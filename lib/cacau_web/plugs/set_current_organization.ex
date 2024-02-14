defmodule CacauWeb.SetCurrentOrganization do
  import Plug.Conn

  use Cacau.Repo

  def init(_opts), do: nil

  def call(conn, _opts) do
    if on_specific_organization_page?(conn) do
      organization_id = get_organization_id_from_request(conn)
      organization = fetch_organization(organization_id)
      assign(conn, :organization, organization)
    else
      conn
    end
  end

  defp on_specific_organization_page?(conn) do
    organization_id = get_organization_id_from_request(conn)
    requested_path = conn.request_path
    organization_path = "/organizations/#{organization_id}"

    requested_path == organization_path
  end

  defp get_organization_id_from_request(conn) do
    # Extract organization ID from request, e.g., params, session, etc.
    # For example:
    # organization_id = Map.get(conn.params, "organization_id")
    Map.get(conn.params, "organization_id")
    # organization_id = 123  # Replace with actual extraction logic
  end

  defp fetch_organization(organization_id) do
    # Fetch organization from the database using the organization_id
    # For example:
    Cacau.Accounts.Organization |> Repo.get(organization_id)
    # Replace with actual fetching logic
    # %Cacau.Organization{name: "Example Organization"}

    # case Cacau.Repo.get(Cacau.Accounts.Organization, organization_id) do
    #   nil ->
    #     raise ArgumentError, "Organization with ID #{organization_id} not found"

    #   organization ->
    #     organization
    # end
  end
end
