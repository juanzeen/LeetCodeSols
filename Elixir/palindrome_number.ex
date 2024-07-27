defmodule Solution do
  @spec is_palindrome(x :: integer) :: boolean

  def is_palindrome(), do: false

  def is_palindrome(x) do
    stack = x |> Integer.to_charlist()

    Enum.reverse(stack)
    |> check_palindrome(stack)
  end

  defp check_palindrome(reversed, original) when reversed === original, do: true
  defp check_palindrome(_reverse, _original), do: false
end
