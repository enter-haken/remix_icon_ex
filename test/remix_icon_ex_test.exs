defmodule RemixIconExTest do
  use ExUnit.Case
  require RemixIconEx.Fetch
  require Logger

  Logger.info("testing icons... this may take a while. ")

  for {topic, _icons} <- RemixIconEx.Fetch.get_icons() do
    for icon_function <-
          Module.concat([RemixIconEx, topic]).__info__(:functions)
          |> Enum.filter(fn {_function, arity} -> arity == 0 end)
          |> Enum.map(fn {function, _arity} -> function end) do
      test "#{icon_function} has at least one char" do
        assert String.length(
                 apply(Module.concat([RemixIconEx, unquote(topic)]), unquote(icon_function), [])
               ) > 0
      end

      test "#{icon_function} starts with svg root tag" do
        assert String.starts_with?(
                 apply(Module.concat([RemixIconEx, unquote(topic)]), unquote(icon_function), []),
                 "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 24 24\" class=\"icon\">"
               ) > 0
      end
    end
  end
end
