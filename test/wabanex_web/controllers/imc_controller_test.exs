defmodule WabanexWeb.IMCControllerTests do
  use WabanexWeb.ConnCase, async: true

  describe "Index/2" do
    test "when user id is valid, return the imc info", %{conn: conn} do
      user_id = "user_id"

      response =
        conn
        |> get(Routes.imc_path(conn, :index, %{id: user_id}))
        |> json_response(:bad_request)

      expected_response = %{"result" => "Invalid UUID"}

      assert response == expected_response
    end

    test "when there are invalid params, return an error", %{conn: conn} do
      params = %{id: "1234567890"}

      response =
        conn
        |> get(Routes.imc_path(conn, :index, params))
        |> json_response(:bad_request)

      expected_response = %{"result" => "Invalid UUID"}

      assert response == expected_response
    end
  end
end
