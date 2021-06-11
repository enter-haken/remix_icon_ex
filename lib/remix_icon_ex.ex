require RemixIconEx.Fetch

raw_icons = RemixIconEx.Fetch.get_icons()

defmodule RemixIconEx do
  @moduledoc File.read!("README.md")
             |> String.split("<!-- MDOC -->")
             |> Enum.fetch!(1)

  for topic <- raw_icons |> Map.keys() do
    module_name = Module.concat([RemixIconEx, topic])

    defmodule module_name do
      @moduledoc """
        Test
      """

      for %{content: content, function_name: function_name} <- raw_icons |> Map.get(topic) do
        @doc """
            iex> #{module_name}.#{function_name}()
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" class="icon">
              <path d="#{content}" />
            </svg>

        """
        def unquote(function_name)(icon_css_class \\ "icon"),
          do: "#{unquote(content)}" |> RemixIconEx.svg_icon(icon_css_class)
      end
    end
  end

  @doc """
  Creates a svg icon for a given path and given icon_css_class
  """
  def svg_icon(path, icon_css_class),
    do: """
    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" class="#{icon_css_class}">
      <path d="#{path}" />
    </svg>
    """
end
