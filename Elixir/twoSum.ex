defmodule Solution do
  @spec two_sum(nums :: [integer], target :: integer, index :: integer) :: [integer]
  def two_sum(nums, target, index\\0) do
    [head | tail] = nums
    |> IO.inspect
    founded_index = Enum.find_index(tail, fn x -> head + x == target end)
    |> IO.inspect
    if founded_index == nil  do
      two_sum(tail, target, index + 1)
    else
      [index, index + founded_index + 1]
    end
  end
end
