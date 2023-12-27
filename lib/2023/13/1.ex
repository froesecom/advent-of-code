defmodule Advent.Day13_1 do
  def run(input) do
    parse(input)
    |> Enum.map(&deduce_row_reflection/1)
    |> Enum.map(&deduce_column_reflection/1)
  end

  defp deduce_column_reflection(puzzle) do
    # we've already categorized it
    if puzzle[:reflection_type] do
      puzzle
    else
      input = puzzle[:input]
      first_row = Enum.at(input, 0) |> Enum.with_index()
      columns_0_indexed = length(first_row) - 1

      Enum.reduce_while(first_row, puzzle, fn {_char, index}, acc ->
        # we're at the end
        if index == columns_0_indexed do
          {:halt, acc}
        else
          case Grid.Reflection.vertical_at?(input, index, index + 1) do
            true ->
              {:halt, Map.merge(puzzle, %{reflection: index, reflection_type: :column})}

            false ->
              {:cont, acc}
          end
        end
      end)
    end
  end

  defp deduce_row_reflection(puzzle) do
    indexed_rows = Enum.with_index(puzzle[:input])
    length_0_indexed = length(indexed_rows) - 1

    Enum.reduce_while(indexed_rows, puzzle, fn {_row, index}, acc ->
      # we're at the end
      if index == length_0_indexed do
        {:halt, acc}
      else
        case Grid.Reflection.horizontal_at?(indexed_rows, index, index + 1) do
          true ->
            {:halt, Map.merge(puzzle, %{reflection: index, reflection_type: :row})}

          false ->
            {:cont, acc}
        end
      end
    end)
  end

  defp parse(input) do
    # ~> [{input: puzzle, reflection: nil, reflection_type: nil}]
    String.split(input, "\n\n", trim: true)
    |> Enum.map(fn puzzle ->
      %{
        input:
          String.split(puzzle, "\n", trim: true)
          |> Enum.map(&String.to_charlist/1),
        reflection: nil,
        reflection_type: nil
      }
    end)
  end
end
