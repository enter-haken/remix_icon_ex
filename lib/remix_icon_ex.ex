defmodule RemixIconEx.Fetch do
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
          "#{topic |> String.downcase()}_#{
            filename
            |> String.replace("-line.svg", "")
            |> String.replace("-", "_")
          }"
          |> String.to_atom()
      }
    end)
    |> Enum.group_by(fn %{topic: topic} -> topic end)
    |> Macro.escape()
  end
end

defmodule RemixIconEx do
  require RemixIconEx.Fetch
  require Logger

  use Phoenix.HTML

  raw_icons = RemixIconEx.Fetch.get_icons()

  for topic <- raw_icons |> Map.keys() do
    for %{content: content, function_name: function_name} <- raw_icons |> Map.get(topic) do
      def unquote(function_name)(background \\ "icon"),
        do: "#{unquote(content)}" |> svg_icon(background)
    end
  end

  defp svg_icon(path, background),
    do: """
    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" class="#{background}">
      <path d="#{path}" />
    </svg>
    """
end
