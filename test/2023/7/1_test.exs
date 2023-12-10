defmodule AdventTest.Day7_1 do
  use ExUnit.Case
  doctest Advent.Day7_1

  test "run" do
    result = Advent.Day7_1.run(File.read!("test/2023/7/1_input.txt"))
    assert result == 250951660
  end
end
