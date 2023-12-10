defmodule AdventTest.Day7_1 do
  use ExUnit.Case
  doctest Advent.Day7_1

  test "parse" do
    result = Advent.Day7_1.parse(File.read!("test/2023/7/1_input.txt"))
    assert Enum.at(result, 0) == ["676AA", 840]
  end

  # test "run" do
  #   Advent.Day7_1.run(File.read!("test/2023/7/1_input.txt"))
  # end

end
