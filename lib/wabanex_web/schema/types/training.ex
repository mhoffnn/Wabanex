defmodule WabanexWeb.Schema.Types.Training do
  use Absinthe.Schema.Notation

  import_types WabanexWeb.Schema.Types.Exercise

  @desc "Logic training representation"
  object :training do
    field :id, non_null(:uuid4)
    field :start_date, non_null(:string)
    field :end_date, non_null(:string)
    field :exercise, list_of(:exercise)
  end

  input_object :create_training_input do
    field :user_id, non_null(:uuid4), description: "User Id"
    field :start_date, non_null(:string), description: "Start Date"
    field :end_date, non_null(:string), description: "End Date"
    field :exercises, list_of(:create_exercise_input), description: "List Of Exercises"
  end
end
