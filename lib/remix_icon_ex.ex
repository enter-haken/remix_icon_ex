require RemixIconEx.Fetch

raw_icons = RemixIconEx.Fetch.get_icons()

defmodule RemixIconEx do
  @moduledoc File.read!("README.md")
             |> String.split("<!-- MDOC -->")
             |> Enum.fetch!(1)

  require Logger

  for topic <- raw_icons |> Map.keys() do
    module_name = Module.concat([RemixIconEx, topic])

    icon_links =
      raw_icons
      |> Map.get(topic)
      |> Enum.map(fn %{content: content, function_name: function_name} ->
        ~s(<a href="RemixIconEx.#{topic}.html##{function_name |> Atom.to_string()}/1" style="margin:1rem;"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="96" height="96" class="icon"> <path d="#{
          content
        }" /></svg></a>)
      end)
      |> Enum.join("")

    module_doc = "<div>#{icon_links}</div>"

    defmodule module_name do
      @moduledoc module_doc

      for %{content: content, function_name: function_name} <- raw_icons |> Map.get(topic) do
        @doc """
            iex> #{module_name}.#{function_name}()
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" class="icon">
              <path d="#{content}" />
            </svg>

        ## example usage 

        ```css
        svg.icon {
          width: 96;
          height: 96;
        }
        ```

        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="96" height="96" class="icon">
          <path d="#{content}" />
        </svg>
        """
        def unquote(function_name)(icon_css_class \\ "icon"),
          do: "#{unquote(content)}" |> RemixIconEx.svg_icon(icon_css_class)
      end
    end
  end

  @doc false
  def svg_icon(path, icon_css_class),
    do: """
    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" class="#{icon_css_class}">
      <path d="#{path}" />
    </svg>
    """
end
