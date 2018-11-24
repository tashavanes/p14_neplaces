defmodule P14Neplaces.Places.Visit do
  use Ecto.Schema
  import Ecto.Changeset


  schema "visits" do
    field :date, :date
    field :description, :string
    field :place, :string
    field :rating, :integer
    field :state, :string
    field :time, :time

    timestamps()
  end

  @doc false
  def changeset(visit, attrs) do
    visit
    |> cast(attrs, [:date, :time, :place, :state, :description, :rating])
    |> validate_required([:date, :time, :place, :state, :description, :rating])
  end
end
