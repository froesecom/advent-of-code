defmodule Advent.Day12_1 do
  def run(input) do
    String.split(input, "\n", trim: true)
    |> Enum.map(&find_arrangements/1)

    # |> Enum.map(&deduce_column_reflection/1)
    # |> sum_reflections
  end

  # "Discovers arrangements for a row ???.### 1,1,3"
  defp find_arrangements(row) do
    String.split(row, " ")
  end
end
