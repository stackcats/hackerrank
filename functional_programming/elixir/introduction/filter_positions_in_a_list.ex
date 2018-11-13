defmodule Solution do
  def filter([], _), do: []
  def filter([x | xs], ct) do
    if rem(ct, 2) != 0 do
      [x | filter(xs, ct + 1)]
    else
      filter(xs, ct + 1)
    end
  end

  def main() do
    xs = input()
    filter(xs, 0)
  end

  defp input do
    IO.stream(:stdio, :line)
    |> Enum.to_list
    |> Enum.map(&String.trim/1)
    |> Enum.map(&String.to_integer/1)
  end
end

Solution.main() |> Enum.map(&IO.puts/1)
