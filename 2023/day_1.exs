calibrations = [
  "1abc2",
  "pqr3stu8vwx",
  "a1b2c3d4e5f",
  "treb7uchet"
]

unicode_decimal_range = 48..57
find_digits = fn s ->
  charlist = to_charlist(s)
  digits = Enum.filter(charlist, fn char -> Enum.member?(unicode_decimal_range, char) end)
  "#{digits}" # convert from charlist to string
end

calibration_accumulator = fn digit_string, acc ->
  first_and_last = String.at(digit_string, 0) <> String.at(digit_string, -1)
  String.to_integer(first_and_last) + acc
end

Enum.map(calibrations, find_digits)
|> Enum.reduce(0, calibration_accumulator)
|> IO.puts
