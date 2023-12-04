defmodule AdventTest.Day1_2 do
  use ExUnit.Case
  doctest Advent.Day1_2

  @calibrations ["onetwo", "243fasd", "twone", "fasdfneafke987sixeightwo"]

  test "run" do
    result = Advent.Day1_2.run(@calibrations)
    assert result == 148
  end
end
