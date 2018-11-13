defmodule Solution do
  def run(0, _), do: []
  def run(_, []), do: []
  def run(n, xs) do
    Enum.flat_map(xs, fn x -> List.duplicate(x, n) end)
  end

  def main() do
    n = IO.gets("") |> String.trim |> String.to_integer
    xs = input()
    run(n, xs)
  end

  defp input do
    IO.stream(:stdio, :line)
    |> Enum.to_list
    |> Enum.map(&String.trim/1)
    |> Enum.map(&String.to_integer/1)
  end
end

Solution.main() |> Enum.map(&IO.puts/1)
