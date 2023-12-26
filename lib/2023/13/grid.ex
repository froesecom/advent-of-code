defmodule Grid.Reflection do
  # we've reached the start of the grid, which reflects everything
  def horizontal_at?(grid, row_index_a, row_index_b) when row_index_a < 0, do: true

  def horizontal_at?(grid, row_index_a, row_index_b) do
    with {row_a, _} <- Enum.at(grid, row_index_a),
         {row_b, _} when row_b != nil <- Enum.at(grid, row_index_b) do
      if row_a != row_b do
        # the rows don't match, so not a reflection
        false
      else
        # the rows match, but we need to keep iterating outwards to check the remaining rows
        __MODULE__.horizontal_at?(grid, row_index_a - 1, row_index_b + 1)
      end
    else
      _ ->
        # the row is nil, meaning we've passed the edge of the grid and nil reflects everything
        true
    end
  end

  # we've reached the start of the grid, which reflects everything
  def vertical_at?(grid, column_index_a, column_index_b) when column_index_a < 0, do: true

  def vertical_at?(grid, column_index_a, column_index_b) do
    Enum.reduce_while(grid, true, fn row, _acc ->
      with column_a <- Enum.at(row, column_index_a),
           column_b when column_b != nil <- Enum.at(row, column_index_b) do
        if column_a != column_b do
          # the columns don't match, so not a reflection
          {:halt, false}
        else
          # the columns match, but we need to keep iterating outwards to check the remaining columns
          {:cont, __MODULE__.vertical_at?(grid, column_index_a - 1, column_index_b + 1)}
        end
      else
        _ ->
          {:halt, true}
      end
    end)
  end
end
