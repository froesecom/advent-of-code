defmodule Advent.Day13_1 do
  def run(input) do
    parse(input)
  end

  def parse(input) do
    String.split(input, "\n\n", trim: true)
    |> Enum.map(fn puzzle ->
      String.split(puzzle, "\n", trim: true)
      |> Enum.map(&String.to_charlist/1)
    end)
  end
end
