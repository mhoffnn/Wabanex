defmodule WabanexWeb.SchemaTest do
  use WabanexWeb.ConnCase, async: true

  alias Wabanex.User
  alias Wabanex.Users.Create

  describe "users queries" do
    test "when a valid id is given, returns the user", %{conn: conn} do
      params = %{
        name: "Sasuke",
        email: "sasuke@uchiha.com",
        password: "naruto123",
        age: 20,
        height: 1.78,
        weight: 62,
        training_goal: "bodybuilding"
      }

      {:ok, %User{id: user_id}} = Create.call(params)

      query = """
        {
          getUser(id: "#{user_id}"){
            name
            email
          }
        }
      """

      response =
        conn
        |> post("/api/graphql", %{query: query})
        |> json_response(:ok)

      expect_response = %{
        "data" => %{
          "getUser" => %{
            "email" => "sasuke@uchiha.com",
            "name" => "Sasuke"
          }
        }
      }

      assert response == expect_response
    end
  end

  describe "users mutations" do
    test "when a valid id is given, returns the user", %{conn: conn} do
      mutation = """
        mutation {
          createUser(input: {
            name: "Sasuke",
            email: "sasuke@uchiha.com",
            password: "naruto123",
            age: 20,
            height: 1.78,
            weight: 62,
            training_goal: "bodybuilding"
          }){
            id
            name
          }
        }
      """

      response =
        conn
        |> post("/api/graphql", %{query: mutation})
        |> json_response(:ok)

      assert %{
               "data" => %{
                 "createUser" => %{
                   "id" => _id,
                   "name" => "Sasuke"
                 }
               }
             } = response
    end
  end
end
