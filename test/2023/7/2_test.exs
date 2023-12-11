defmodule AdventTest.Day7_2 do
  use ExUnit.Case
  doctest Advent.Day7_2

  test "run" do
    result = Advent.Day7_2.run(File.read!("test/2023/7/1_input.txt"))
    assert result == 250951660
  end
end
