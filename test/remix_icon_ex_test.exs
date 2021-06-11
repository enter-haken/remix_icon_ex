defmodule RemixIconExTest do
  use ExUnit.Case
  doctest RemixIconEx

  for icon_function <-
        RemixIconEx.__info__(:functions)
        |> Enum.filter(fn {_function, arity} -> arity == 0 end)
        |> Enum.map(fn {function, _arity} -> function end) do
    test "create #{icon_function} icons" do
      assert String.length(apply(RemixIconEx, unquote(icon_function), [])) > 0
    end
  end
end
