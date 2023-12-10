defmodule Advent.Day7_1 do
  def run(input) do
    parse(input)
    |> Enum.map(&append_hand_power/1)
  end

  defp append_hand_power([hand | tail]) do
    # -> [hand, bid, power]
    power = String.to_charlist(hand)
    |> Enum.frequencies
    |> Map.values
    |> Enum.sort
    |> Enum.join("")

    # TODO: map to hand strength here
    List.flatten([hand, tail, power])
  end

  defp parse(input) do
    # -> [[hand, bid]]
    String.split(input, "\n", trim: true)
    |> Enum.map(&String.split(&1, " ", trim: true))
    |> Enum.map(fn ([hand | bid]) ->
      [hand, String.to_integer(hd(bid))]
    end)
  end
end
