defmodule AdventTest.Day2_2 do
  use ExUnit.Case
  doctest Advent.Day2_2

  @game_checks [
    %{
      id: 1,
      checks: [
        %{red: "1", blue: "3", green: "11"},
        %{blue: "1", red: "5"},
        %{blue: "3", green: "5", red: "13"},
        %{red: "6", blue: "1", green: "4"},
        %{red: "16", green: "12"}
      ]
    },
    %{
      id: 2,
      checks: [
        %{red: "3", blue: "13", green: "5"},
        %{green: "14", blue: "14"},
        %{blue: "9", green: "10", red: "3"},
        %{green: "2", blue: "5"},
        %{green: "11", blue: "3", red: "3"},
        %{blue: "16", red: "2", green: "9"}
      ]
    }
  ]
  test "run" do
    assert Advent.Day2_2.run(@game_checks) == 1248
  end
end
