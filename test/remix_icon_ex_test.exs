defmodule RemixIconExTest do
  use ExUnit.Case
  doctest RemixIconEx

  test "create icons" do
    xxx = """
          <html>
    <head>
    <style>
      svg {
        width: 24;
        height: 24;
        stroke-width: 0;
      }
      body {
      display: flex;
      flex-wrap: wrap;
    } 
    div {
      margin: 2rem;
      text: center;
    }
    </style>
    </head>
    <body>
      #{RemixIconEx.__info__(:functions)
      |> Enum.filter(fn {_, x} -> x == 0 end)
      |> Enum.map(fn {function, _} -> function end)
      |> Enum.map(fn x -> "<div><p>#{x}</p> #{apply(RemixIconEx, x, [])}</div>" end)
      |> Enum.join(" ")}
    </body>
    </html>
    """

    File.write!("/tmp/index.html", xxx)


    
  end
end
