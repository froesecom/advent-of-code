# Advent of Code
Where I keep my [Advent of Code](https://adventofcode.com/) scripts


## tests

`mix test` to run tests

To run a single test suite `mix test --only describe:"Advent.Day12_1.run/1"`


## formatting

`mix format mix.exs "lib/**/*.{ex,exs}" "test/**/*.{ex,exs}"`

## docs
### offline docs

`mix hex.docs fetch` to fetch elixir and phoneix docs for current installed versions.

`mix hex.docs offline elixir 1.16.2` to view offline docs
