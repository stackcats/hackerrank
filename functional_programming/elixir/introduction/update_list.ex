defmodule Solution do
  def main() do
    xs = input()
    for x <- xs, do: abs(x)
  end
  
    defp input do
      IO.stream(:stdio, :line)
      |> Enum.to_list
      |> Enum.map(&String.trim/1)
      |> Enum.map(&String.to_integer/1)
    end
end

Solution.main() |> Enum.each(&IO.puts/1)
