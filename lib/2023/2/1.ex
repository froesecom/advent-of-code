defmodule Advent.Day2_1 do
  defmodule Validator do
    def run(rule, game) do
      case rule[:type] do
        "<=" ->
          less_or_equal(rule, game)
      end
    end

    defp less_or_equal(rule, game) do
      target = rule[:target]
      color = rule[:forColor]

      Enum.all?(game[:checks], fn check ->
        !Map.get(check, color) || Map.get(check, color) |> String.to_integer() <= target
      end)
    end
  end

  def run(game_checks, validation_rules) do
    Enum.reduce(game_checks, 0, fn game, acc ->
      if game_valid?(game, validation_rules) do
        game[:id] + acc
      else
        acc
      end
    end)
  end

  defp game_valid?(game, validation_rules) do
    Enum.all?(validation_rules, fn rule -> Validator.run(rule, game) end)
  end
end
