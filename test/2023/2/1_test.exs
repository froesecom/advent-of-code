defmodule AdventTest.Day2_1 do
  use ExUnit.Case
  doctest Advent.Day2_1

  @validation_rules [
    %{type: "<=", forColor: :red, target: 12},
    %{type: "<=", forColor: :green, target: 13},
    %{type: "<=", forColor: :blue, target: 14}
  ]

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
    },
    %{
      id: 3,
      checks: [
        %{blue: "17", red: "5"},
        %{red: "3", green: "11", blue: "17"},
        %{red: "1", blue: "6", green: "9"},
        %{blue: "3", green: "11", red: "1"},
        %{green: "3", red: "10", blue: "11"},
        %{red: "12", green: "3", blue: "15"}
      ]
    },
    %{
      id: 4,
      checks: [
        %{blue: "1", red: "5"},
        %{red: "3", green: "11", blue: "1"},
        %{red: "1", blue: "6", green: "9"},
        %{blue: "3", green: "11", red: "1"},
        %{green: "3", red: "10", blue: "11"},
        %{red: "12", green: "3", blue: "5"}
      ]
    },
    %{
      id: 5,
      checks: [
        %{green: "1", red: "1", blue: "1"},
        %{red: "1", green: "1", blue: "1"},
        %{green: "6", red: "1"},
        %{green: "7"}
      ]
    }
  ]

  test "run" do
    result = Advent.Day2_1.run(@game_checks, @validation_rules)
    assert result == 9
  end
end
