defmodule CacauWeb.OrganizationHTML do
  use CacauWeb, :html

  embed_templates "organization_html/*"

  @doc """
  Renders a organization form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def organization_form(assigns)
end
