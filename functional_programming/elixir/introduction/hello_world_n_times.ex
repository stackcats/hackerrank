defmodule Solution do
  def main() do
    n = IO.gets("") |> String.trim |> String.to_integer
    List.duplicate("Hello World", n)
  end
end

Solution.main() |> Enum.each(&IO.puts/1)
