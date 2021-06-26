defmodule WabanexWeb.Schema.Types.User do
  use Absinthe.Schema.Notation

  @desc "Logic user representation"
  object :user do
    field :id, non_null(:uuid4)
    field :name, non_null(:string)
    field :email, non_null(:string)
    field :trainings, list_of(:training)
    field :weight, non_null(:float)
    field :height, non_null(:float)
    field :age, non_null(:integer)
    field :training_goal, non_null(:string)
  end

  input_object :create_user_input do
    field :name, non_null(:string), description: "User Name"
    field :email, non_null(:string), description: "User Email"
    field :password, non_null(:string), description: "User Password"
    field :weight, non_null(:float), description: "User Weight"
    field :height, non_null(:float), description: "User Height"
    field :age, non_null(:integer), description: "User Age"
    field :training_goal, non_null(:string), description: "User Training Type"
  end
end
