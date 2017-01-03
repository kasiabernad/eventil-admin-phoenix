defmodule EventilAdmin.AgendaSession do
  use EventilAdmin.Web, :model
  import Ecto.Query

  schema "agenda_sessions" do
    field :name, :string
    field :start_time, Ecto.Time
    field :end_time, Ecto.Time
    field :kind, :integer
    timestamps(inserted_at: :created_at)

    belongs_to :event, EventilAdmin.Event
  end

  def event_types(kind) do
    allFields = ['normal', 'organization', 'workshop', 'entertainment', 'lightning', 'keynote', 'party']
    Enum.at(allFields, kind)
  end

  def event_type(model) do
    event_types(model.kind)
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :start_time, :end_time, :kind, :event_id])
    |> validate_required([:name, :start_time, :end_time, :kind, :event_id])
  end
end
