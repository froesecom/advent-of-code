defmodule AdventTest.Y2024.D1_1 do
  use ExUnit.Case
  doctest Advent.Y2024.D1_1

  test "run small data set" do
    result = Advent.Y2024.D1_1.run(File.read!("test/2024/1/1_data_small.txt"))
    assert result == 11
  end

  test "run" do
    result = Advent.Y2024.D1_1.run(File.read!("test/2024/1/1_data.txt"))
    assert result == 2_166_959
  end
end
