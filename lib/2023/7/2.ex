defmodule Advent.Day7_2 do
  def run(input) do
    parse(input)
    |> Enum.map(&prepend_hand_power/1)
    |> Enum.map(&convert_hand_to_base13/1)
    # sort by hand power then cards in hand
    |> Enum.sort_by(&{Enum.at(&1, 0), Enum.at(&1, 1)})
    |> Enum.with_index(1)
    |> Enum.reduce(0, fn {hand, index}, acc ->
      bid = Enum.at(hand, 2)
      acc + bid * index
    end)
  end

  defp convert_hand_to_base13([power | [hand | bid]]) do
    # stolen from David C.
    # 13 possible cards
    # By converting the cards to base 13 value, you can use standard lib to sort
    # -> [power, base13_hand, bid]
    List.flatten([power, Poker.Hand.Part2.to_base_13(hand), bid])
  end

  defp parse(input) do
    # -> [[hand, bid]]
    String.split(input, "\n", trim: true)
    |> Enum.map(&String.split(&1, " ", trim: true))
    |> Enum.map(fn [hand | bid] ->
      [hand, String.to_integer(hd(bid))]
    end)
  end

  defp prepend_hand_power([hand | tail]) do
    # -> [power, hand, bid]
    power = Poker.Hand.Part2.to_power(hand)
    List.flatten([power, hand, tail])
  end
end

defmodule Poker.Hand.Part2 do
  @power_map %{
    "11111": 0,
    "2111": 1,
    "221": 2,
    "311": 3,
    "32": 4,
    "41": 5,
    "5": 6
  }

  @face_card_base13_map %{
    A: 12,
    K: 11,
    Q: 10,
    J: 0,
    T: 9
  }

  # "J" decimal value
  @wildcard 74

  def to_base_13(hand) do
    String.reverse(hand)
    |> String.codepoints()
    |> Enum.with_index()
    |> Enum.map(fn {char, index} ->
      char_atom = String.to_atom(char)
      # if it's not a face card then
      # it's a numerical card that needs to be zero indexed "1" -> 0
      # "J" wildcard is the 0 in this problem
      value = @face_card_base13_map[char_atom] || String.to_integer(char) - 1
      # translate to base 13
      value * 13 ** index
    end)
    |> Enum.sum()
  end

  def to_power(hand) do
    hand_power_key =
      String.to_charlist(hand)
      |> Enum.frequencies()
      |> handle_wildcards
      |> Map.values()
      |> Enum.sort(:desc)
      |> Enum.join("")

    @power_map[String.to_atom(hand_power_key)]
  end

  defp handle_wildcards(hand_frequencies) do
    {wildcards, remaining_card_frequencies} = Map.pop(hand_frequencies, @wildcard)

    case wildcards do
      # all cards are wildcards
      5 ->
        hand_frequencies

      # no wildcards
      nil ->
        hand_frequencies

      _ ->
        # find highest frequency card and add wilcards to it
        {largest_key, value} =
          Enum.sort_by(remaining_card_frequencies, &elem(&1, 1), :desc)
          |> Enum.at(0)

        Map.put(remaining_card_frequencies, largest_key, value + wildcards)
    end
  end
end
