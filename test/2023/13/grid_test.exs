defmodule GridTest.Reflection do
  use ExUnit.Case
  doctest Grid.Reflection

  describe "vertical_at?" do
    test "returns true for vertical reflection" do
      grid = [
        ~c"#.##.#.",
        ~c"######.",
        ~c"######.",
        ~c"#.##.#.",
        ~c"#.##.##"
      ]

      result = Grid.Reflection.vertical_at?(grid, 2, 3)
      assert result == true
    end

    test "returns false when no vertical reflection found" do
      grid = [
        ~c"#.##.#.",
        ~c"####.#.",
        ~c"######.",
        ~c"#.##.#.",
        ~c"#.##.##"
      ]

      result = Grid.Reflection.vertical_at?(grid, 2, 3)
      assert result == false
    end
  end

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

    test "it returns true for horizontal reflections in first row" do
      grid = [
        {"###..#.", 0},
        {"###..#.", 1},
        {"#.#..#.", 2},
        {"#.#..#.", 3},
        {"#.#..##", 4}
      ]

      result = Grid.Reflection.horizontal_at?(grid, 0, 1)
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
