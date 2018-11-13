defmodule Solution do
  def main() do
    xs = input()
    xs |> Enum.filter(&(&1 |> abs |> rem(2) == 1)) |> Enum.sum |> IO.puts
  end
  
  defp input do
    IO.stream(:stdio, :line)
    |> Enum.to_list
    |> Enum.map(&String.trim/1)
    |> Enum.map(&String.to_integer/1)
  end  
end

Solution.main()
