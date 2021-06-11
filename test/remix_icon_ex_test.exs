defmodule RemixIconExTest do
  use ExUnit.Case
  doctest RemixIconEx

  for icon_function <-
        RemixIconEx.__info__(:functions)
        |> Enum.filter(fn {_function, arity} -> arity == 0 end)
        |> Enum.map(fn {function, _arity} -> function end) do
    test "#{icon_function} has at least one char" do
      assert String.length(apply(RemixIconEx, unquote(icon_function), [])) > 0
    end

    test "#{icon_function} begins with svg tag" do
      assert String.starts_with?(
               apply(RemixIconEx, unquote(icon_function), []),
               "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 24 24\" class=\"icon\">"
             )
    end
  end

  for icon_function <-
        RemixIconEx.__info__(:functions)
        |> Enum.filter(fn {_function, arity} -> arity == 1 end)
        |> Enum.map(fn {function, _arity} -> function end) do
    test "#{icon_function} with custom css class has at least one char" do
      assert String.length(apply(RemixIconEx, unquote(icon_function), ["other"])) > 0
    end

    test "#{icon_function} with custom css class begins with svg tag" do
      assert String.starts_with?(
               apply(RemixIconEx, unquote(icon_function), ["other"]),
               "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 24 24\" class=\"other\">"
             )
    end
  end
end
