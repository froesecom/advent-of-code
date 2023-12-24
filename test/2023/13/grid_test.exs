defmodule GridTest.Reflection do
  use ExUnit.Case
  doctest Grid.Reflection

  describe "horizontal_at?" do
    test "it returns true for horizontal reflections" do
      grid = [
        {"#.#..#.", 0},
        {"###..#.", 1},
        {"###..#.", 2},
        {"#.#..#.", 3},
        {"#.#..##", 4}
      ]

      result = Grid.Reflection.horizontal_at?(grid, 1, 2)
      assert result == true
    end

    test "it returns false when no horizontal reflection found" do
      grid = [
        {"#.#..#.##..##", 0},
        {"##.##.##....#", 1},
        {"###..###.....", 2},
        {"###..###.##.#", 3}
      ]

      result = Grid.Reflection.horizontal_at?(grid, 1, 2)
      assert result == false
    end
  end
end
