"""
<html>
<head>
  <style>
    svg.icon {
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
  #{
  RemixIconEx.__info__(:functions)
  |> Enum.filter(fn {_function, arity} -> arity == 0 end)
  |> Enum.map(fn {function, _arity} -> function end)
  |> Enum.map(fn x -> "<div><p>#{x}</p> #{apply(RemixIconEx, x, [])}</div>" end)
  |> Enum.join(" ")
}
</body>
</html>
"""
|> IO.puts()
