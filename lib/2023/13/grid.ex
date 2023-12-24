defmodule Grid.Reflection do
  def horizontal_at?(grid, index_a, index_b) do
    val_a = Enum.at(grid, index_a)
    val_b = Enum.at(grid, index_b)

    # we've reached the edge of the grid which reflects everything
    if val_a == nil || val_b == nil do
      true
    else
      {row_a, _i} = Enum.at(grid, index_a)
      {row_b, _i} = Enum.at(grid, index_b)

      # if rows do not match == not a reflection
      # if they match, we need to check remaining rows
      if row_a != row_b do
        false
      else
        __MODULE__.horizontal_at?(grid, index_a - 1, index_b + 1)
      end
    end
  end

  # def vertical_at?(grid, column_index) do
  #   IO.puts "doing the damn thing"
  # end
end
