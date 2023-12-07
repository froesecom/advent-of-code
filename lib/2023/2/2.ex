defmodule Advent.Day2_2 do
  def run(game_checks) do
    Enum.map(game_checks, &convert_vals_to_integers/1)
    |> Enum.map(&game_power_accumulator/1)
    |> Enum.sum()
  end

  defp convert_vals_to_integers(game_check) do
    Enum.map(game_check[:checks], fn check ->
      Map.to_list(check)
      |> Enum.map(fn {k, v} ->
        {k, String.to_integer(v)}
      end)
      |> Map.new()
    end)
  end

  defp game_power_accumulator(game) do
    [start_check | tail] = game

    Enum.reduce(tail, start_check, fn check, acc ->
      Enum.to_list(check)
      |> Enum.reduce(acc, fn {key, val}, acc1 ->
        Map.update(acc1, key, val, fn existing_val ->
          if val > existing_val do
            val
          else
            existing_val
          end
        end)
      end)
    end)
    |> Map.values()
    |> Enum.reduce(1, fn n, acc -> acc * n end)
  end
end
