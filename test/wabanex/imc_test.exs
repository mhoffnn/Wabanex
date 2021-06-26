defmodule Wabanex.IMCTest do
  use ExUnit.Case, async: true

  describe "calculate/1" do
    test "When the file exists, returs the data" do
      params = %{"filename" => "students.csv"}

      response = Wabanex.IMC.calculate(params)

      expected_response = {
        :ok,
        %{
          "Adroaldo" => 23.37472607742878,
          "Ivone" => 20.811654526534856,
          "Matheus" => 16.787190082644628,
          "Nathascha" => 20.307412205454995
        }
      }

      assert response == expected_response
    end

    test "When the wrong file name is given, return an error" do
      params = %{"filename" => "sasuke.csv"}

      response = Wabanex.IMC.calculate(params)

      expected_response = {:error, "Error while opening the file"}

      assert response == expected_response
    end
  end
end
