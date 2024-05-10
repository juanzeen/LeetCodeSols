defmodule Solution do
  @spec find_median_sorted_arrays(nums1 :: [integer], nums2 :: [integer]) :: float
  def find_median_sorted_arrays(nums1, nums2) do
        nums_list = nums1 ++ nums2 |>Enum.sort()
        if  rem(length(nums_list), 2) == 0 do
          (Enum.at(nums_list, div(length(nums_list), 2)) +  Enum.at(nums_list, div(length(nums_list), 2) -1)) /2
        else
          Enum.at(nums_list, div(length(nums_list),2))/1
        end
  end
end
