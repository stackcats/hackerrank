defmodule Solution do
  def reverse([]), do: []
  def reverse([x | xs]) do
    reverse(xs) ++ [x]    
  end

  def main() do
    xs = input()
    reverse(xs)
  end
  
  defp input do
    IO.stream(:stdio, :line)
    |> Enum.to_list
    |> Enum.map(&String.trim/1)
    |> Enum.map(&String.to_integer/1)
  end
end

Solution.main() |> Enum.map(&IO.puts/1)
