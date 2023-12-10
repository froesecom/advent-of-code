defmodule Advent.Day7_1 do
  def run(input) do
    parse(input)
    |> categorize
  end

  defp categorize(hands) do
    # [[hand, bid, category]]
    Enum.at(hands, 0) |> IO.puts
    Enum.map(hands, &append_hand_type/1)
  end

  defp append_hand_type(hand) do
    # IO.puts hand
  end

  def parse(input) do
    # [[hand, bid]]
    String.split(input, "\n", trim: true)
    |> Enum.map(&String.split(&1, " ", trim: true))
    |> Enum.map(fn ([hand | bid]) ->
      [hand, String.to_integer(hd(bid))]
    end)
  end
end
