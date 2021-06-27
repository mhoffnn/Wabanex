defmodule Wabanex.IMCTest do
  use ExUnit.Case, async: true

  describe "calculate/1" do
    test "When the user id is valid, returs the data" do
      params = %{name: "Sasuke", height: 1.78, weight: 71}

      response = Wabanex.IMC.calculate_imc(params)

      expected_response = {
        "Sasuke",
        22.408786769347305
      }

      assert response == expected_response
    end

    test "When the wrong file name is given, return an error" do
      params = "id_invalid"

      response = Wabanex.IMC.calculate(params)

      expected_response = {:error, "Invalid UUID"}

      assert response == expected_response
    end
  end
end
