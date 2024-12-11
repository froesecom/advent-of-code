defmodule Advent.Y2024.D1_1 do
  def run(input) do
    parse(input)
    |> sort_locations
    |> sum_location_difference
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

  defp sort_locations(locations) do
    [Enum.sort(Enum.at(locations, 0)), Enum.sort(Enum.at(locations, 1))]
  end

  defp sum_location_difference(locations) do
    first = Enum.with_index(Enum.at(locations, 0))
    second = Enum.at(locations, 1)

    calc_diff = fn tuple, acc ->
      {n, index} = tuple
      acc + abs(n - Enum.at(second, index))
    end

    Enum.reduce(first, 0, calc_diff)
  end
end
