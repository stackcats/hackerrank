defmodule Solution do
  def main() do
    a = IO.gets("") |> String.strip |> String.to_integer
    b = IO.gets("") |> String.strip |> String.to_integer
    a + b |> IO.puts
  end
end

Solution.main()
