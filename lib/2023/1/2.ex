defmodule Advent.Day1_2 do
  @digit_map %{
    one: "1",
    two: "2",
    three: "3",
    four: "4",
    five: "5",
    six: "6",
    seven: "7",
    eight: "8",
    nine: "9"
  }

  def run(calibrations) do
    Enum.map(calibrations, &find_digits/1)
    |> Enum.reduce(0, &calibration_accumulator/2)
  end

  defp find_digits(s) do
    first = find_first_digit(s) |> map_digit
    last = find_last_digit(s) |> map_digit
    first <> last
  end

  defp map_digit(s) do
    key = String.to_atom(s)
    # it's a digit already if not in the map
    @digit_map[key] || s
  end

  defp find_first_digit(s) do
    regex = ~r/(1|2|3|4|5|6|7|8|9|one|two|three|four|five|six|seven|eight|nine)/
    Regex.run(regex, s) |> Enum.at(0)
  end

  defp find_last_digit(s) do
    reversed_regex = ~r/(enin|thgie|neves|xis|evif|ruof|eerht|owt|eno|9|8|7|6|5|4|3|2|1)/
    reversed_string = String.reverse(s)
    Regex.run(reversed_regex, reversed_string) |> Enum.at(0) |> String.reverse
  end

  defp calibration_accumulator(digit_string, acc) do
    String.to_integer(digit_string) + acc
  end

end
