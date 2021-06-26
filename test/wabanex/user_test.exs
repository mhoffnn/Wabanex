defmodule Wabanex.UserTest do
  use Wabanex.DataCase, async: true

  alias Wabanex.User

  describe "changeset/1" do
    test "when all params are valid, returns the changeset" do
      params = %{name: "Sasuke", email: "sasuke@uchiha.com", password: "naruto123"}

      response = User.changeset(params)

      assert %Ecto.Changeset{
               valid?: true,
               changes: %{email: "sasuke@uchiha.com", name: "Sasuke", password: "naruto123"},
               errors: []
             } = response
    end

    test "when there are invalid params, returns a invalid changeset" do
      params = %{name: "S", email: "Sa@i.com"}

      response = User.changeset(params)

      expected_response = %{
        name: ["should be at least 2 character(s)"],
        password: ["can't be blank"]
      }

      assert errors_on(response) == expected_response
    end
  end
end
