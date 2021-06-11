defmodule RemixIconEx.Fetch do
  @moduledoc false

  import SweetXml

  defmacro get_icons() do
    Path.wildcard("remix_icons/**")
    |> Enum.filter(fn x -> String.contains?(x, "-line.svg") end)
    |> Enum.map(fn x ->
      [_, _, topic, filename] = String.split(x, "/")

      %{
        content: File.read!(x) |> xpath(~x"string(//path[2]/@d)"s),
        topic: topic |> String.to_atom(),
        function_name:
          filename
          |> String.replace("-line.svg", "")
          |> String.replace("-", "_")
          |> String.to_atom()
      }
    end)
    |> Enum.group_by(fn %{topic: topic} -> topic end)
    |> Macro.escape()
  end
end