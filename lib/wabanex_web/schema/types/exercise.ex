defmodule WabanexWeb.Schema.Types.Exercise do
  use Absinthe.Schema.Notation

  @desc "Logic exercise representation"
  object :exercise do
    field :id, non_null(:uuid4)
    field :name, non_null(:string)
    field :youtube_video_url, non_null(:string)
    field :protocol_description, non_null(:string)
    field :repetitions, non_null(:string)
  end

  input_object :create_exercise_input do
    field :name, non_null(:string), description: "Users Name"
    field :youtube_video_url, non_null(:string), description: "Youtube Video URL"
    field :protocol_description, non_null(:string), description: "Protocol Description"
    field :repetitions, non_null(:string), description: "Repetitions"
  end
end
