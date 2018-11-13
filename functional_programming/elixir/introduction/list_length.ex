defmodule Solution do
  def length([], acc), do: acc
  def length([_ | xs], acc), do: length(xs, acc + 1)

  def main() do
    xs = input()
    xs |> length(0) |> IO.puts
  end
  
  defp input do
    IO.stream(:stdio, :line)
    |> Enum.to_list
    |> Enum.map(&String.trim/1)
    |> Enum.map(&String.to_integer/1)
  end  
end

Solution.main()
