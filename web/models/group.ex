defmodule Fishbowl.Group do
  use Fishbowl.Web, :model

  schema "groups" do
    field :name, :string
    field :code, :string
    has_many :user_groups, Fishbowl.UserGroup

    timestamps
  end

  @required_fields ~w(name)
  @optional_fields ~w(code)

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
