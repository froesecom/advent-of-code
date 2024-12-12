defmodule AdventTest.Y2024.D1_2 do
  use ExUnit.Case
  doctest Advent.Y2024.D1_2

  test "run small data set" do
    result = Advent.Y2024.D1_2.run(File.read!("test/2024/1/2_data_small.txt"))
    assert result == 31
  end

  test "run" do
    result = Advent.Y2024.D1_2.run(File.read!("test/2024/1/2_data.txt"))
    assert result == 23_741_109
  end
end
