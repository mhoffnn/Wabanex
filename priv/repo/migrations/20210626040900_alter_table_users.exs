defmodule Wabanex.Repo.Migrations.AlterTableUsers do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :weight, :float
      add :height, :float
      add :age, :integer
      add :training_goal, :string

    end
  end
end
