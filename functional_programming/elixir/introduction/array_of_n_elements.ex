defmodule Solution do
  def main() do
    n = IO.gets("") |> String.trim |> String.to_integer
    IO.puts "[#{List.duplicate(1, n) |> Enum.join(", ")}]"
  end
end

Solution.main()
