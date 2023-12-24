defmodule Grid.Reflection do
  def horizontal_at?(grid, index_a, index_b) do
    with {row_a, _} when row_a != nil <- Enum.at(grid, index_a),
         {row_b, _} when row_b != nil <- Enum.at(grid, index_b) do
      if row_a != row_b do
        # the rows don't match, so not a reflection
        false
      else
        # the rows match, but we need to keep iterating outwards to check the remaining rows
        __MODULE__.horizontal_at?(grid, index_a - 1, index_b + 1)
      end
    else
      _ ->
        # the row is nil, meaning we've passed the edge of the grid and nil reflects everything
        true
    end
  end

  # def vertical_at?(grid, column_index) do
  #   IO.puts "doing the damn thing"
  # end
end
