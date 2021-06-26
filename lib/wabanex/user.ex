defmodule Wabanex.User do
  use Ecto.Schema
  import Ecto.Changeset

  alias Wabanex.Training

  @primary_key {:id, :binary_id, autogenerate: true}

  @fields [:email, :password, :name, :weight, :height, :training_goal, :age]
  @enum_goals ["welfare", "bodybuilding", "lose weight"]

  schema "users" do
    field :email, :string
    field :name, :string
    field :password, :string
    field :weight, :float
    field :height, :float
    field :age, :integer
    field :training_goal, :string

    has_many :trainings, Training

    timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @fields)
    |> validate_required(@fields)
    |> validate_length(:password, min: 6)
    |> validate_length(:name, min: 2)
    |> validate_format(:email, ~r/@/)
    |> unique_constraint([:email])
    |> validate_number(:height, less_than: 2.15, greater_than: 1.45)
    |> validate_number(:weight, less_than: 250, greater_than: 40)
    |> validate_inclusion(:age, 18..90)
    |> validate_inclusion(:training_goal, @enum_goals)
  end
end
