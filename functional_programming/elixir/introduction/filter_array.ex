defmodule Solution do
  def filter(_, []), do: []
  def filter(x, [y | ys]) when y < x do
    [y | filter(x, ys)]
  end
  def filter(x, [_ | ys]), do: filter(x, ys)


  def main() do
    x = IO.gets("") |> String.trim |> String.to_integer
    xs = input()
    filter(x, xs)
  end

  defp input do
    IO.stream(:stdio, :line)
    |> Enum.to_list
    |> Enum.map(&String.trim/1)
    |> Enum.map(&String.to_integer/1)
  end
end

Solution.main() |> Enum.map(&IO.puts/1)
