defmodule Advent.Y2024.D1_2 do
  def run(input) do
    parse(input)
    |> reduce_similarities
  end

  # -> [[3, 3, 1, 2, 4, 3], [3, 9, 3, 5, 3, 4]]
  defp parse(input) do
    build_arrays = fn row, acc ->
      r = String.split(row, "   ")
      first = String.to_integer(Enum.at(r, 0))
      second = String.to_integer(Enum.at(r, 1))

      [List.insert_at(Enum.at(acc, 0), 0, first), List.insert_at(Enum.at(acc, 1), 0, second)]
    end

    String.split(input, "\n", trim: true)
    |> Enum.reduce([[], []], build_arrays)
  end

  defp reduce_similarities(input) do
    first = Enum.at(input, 0)
    second = Enum.at(input, 1)

    reduce_smiliarity = fn n, acc ->
      acc + n * Enum.count(second, fn x -> n == x end)
    end

    Enum.reduce(first, 0, reduce_smiliarity)
  end
end
