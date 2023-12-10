defmodule Advent.Day7_1 do
  def run(input) do
    parse(input)
    |> Enum.map(&prepend_hand_power/1)
  end

  defp prepend_hand_power([hand | tail]) do
    # -> [power, hand, bid]
    IO.puts hand
    power = Poker.Hand.to_power(hand)
    List.flatten([power, tail, hand])
  end

  defp parse(input) do
    # -> [[hand, bid]]
    String.split(input, "\n", trim: true)
    |> Enum.map(&String.split(&1, " ", trim: true))
    |> Enum.map(fn [hand | bid] ->
      [hand, String.to_integer(hd(bid))]
    end)
  end
end

defmodule Poker.Hand do
  @power_map %{
    "11111": 0,
    "2111": 1,
    "221": 2,
    "311": 3,
    "32": 4,
    "41": 5,
    "5": 6
  }

  def to_power(hand) do
    hand_power_key =
      String.to_charlist(hand)
      |> Enum.frequencies()
      |> Map.values()
      |> Enum.sort(:desc)
      |> Enum.join("")

    @power_map[String.to_atom(hand_power_key)]
  end
end
