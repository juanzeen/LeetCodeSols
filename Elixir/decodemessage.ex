defmodule Solution do
  @alphabet String.to_charlist("abcdefghijklmnopqrstuvwxyz")

  @spec decode_message(key :: String.t(), message :: String.t()) :: String.t()
  def decode_message(key, message) do
    codification =
      key
      |> String.to_charlist()
      |> find_codification()

    IO.inspect(codification)

    decoded_message =
      message
      |> String.to_charlist()
      |> decode(codification)

    decoded_message
  end

  @spec find_codification(key :: List.t(), base :: List.t(), acc :: Map.t()) :: Map.t()
  defp find_codification(key, base \\ @alphabet, acc \\ %{" " => " "})

  defp find_codification([], _base, acc), do: acc
  defp find_codification(_key, [], acc), do: acc

  defp find_codification([h | t], base, acc) do
    cond do
      Map.has_key?(acc, <<h::utf8>>) ->
        find_codification(t, base, acc)

      true ->
        [head | tail] = base
        new_acc = Map.put(acc, <<h::utf8>>, <<head::utf8>>)
        find_codification(t, tail, new_acc)
    end
  end

  @spec decode(message :: List.t(), codification :: Map.t(), acc :: String.t()) :: String.t()

  defp decode(message, codification, acc \\ "")

  defp decode([], _codification, acc) do
    acc
  end

  defp decode([h | t], codification, acc) do
    new_acc = acc <> Map.get(codification, <<h::utf8>>)
    decode(t, codification, new_acc)
  end
end
