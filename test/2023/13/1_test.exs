defmodule AdventTest.Day13_1 do
  use ExUnit.Case
  doctest Advent.Day13_1

  test "run" do
    result = Advent.Day13_1.run(File.read!("test/2023/13/1_data_small.txt"))
    assert result == 405
  end
end
