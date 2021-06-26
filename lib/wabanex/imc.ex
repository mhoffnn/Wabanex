defmodule Wabanex.IMC do
  alias Ecto.UUID
  alias Wabanex.{Repo, User}

  def calculate(id) do
    id
    |> UUID.cast()
    |> handle_response()
  end

  defp handle_response(:error) do
    {:error, "Invalid UUID"}
  end

  defp handle_response({:ok, uuid}) do
    case Repo.get(User, uuid) do
      nil -> {:error, "User not found"}
      user -> {:ok, calculate_imc(user)}
    end
  end

  defp calculate_imc(%{name: name, height: height, weight: weight}) do
    {name, weight / (height * height)}
  end
end
