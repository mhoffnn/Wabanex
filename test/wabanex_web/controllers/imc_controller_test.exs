defmodule WabanexWeb.IMCControllerTests do
  use WabanexWeb.ConnCase, async: true

  describe "Index/2" do
    test "when all params are valid, return the imc info", %{conn: conn} do
      params = %{"filename" => "students.csv"}

      response =
        conn
        |> get(Routes.imc_path(conn, :index, params))
        |> json_response(:ok)

      expected_response = %{
        "result" => %{
          "Adroaldo" => 23.37472607742878,
          "Ivone" => 20.811654526534856,
          "Matheus" => 16.787190082644628,
          "Nathascha" => 20.307412205454995
        }
      }

      assert response == expected_response
    end

    test "when there are invalid params, return an error", %{conn: conn} do
      params = %{"filename" => "banan.csv"}

      response =
        conn
        |> get(Routes.imc_path(conn, :index, params))
        |> json_response(:bad_request)

      expected_response = %{"result" => "Error while opening the file"}

      assert response == expected_response
    end
  end
end
