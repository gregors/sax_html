# SaxHtml

Simple SAX-like parser for HTML.
It accepts an html string and an anonymous callback function that fires for every event


```elixir
html_text = """
<html>
  <head>
    <title>Gregors</title>
  </head>
  <body>
    <div>
      <p>Howdy!!!</p>
    </div>
  </body>
</html>
"""

handler = fn {event, data} -> IO.puts("#{event} - #{data}") end

SaxHtml.parse(html_text, handler)
start_tag - html
characters -

start_tag - head
characters -

start_tag - title
characters - Gregors
end_tag - title
characters -

end_tag - head
characters -

start_tag - body
characters -

start_tag - div
characters -

start_tag - p
characters - Howdy!!!
end_tag - p
characters -

end_tag - div
characters -

end_tag - body
characters -

end_tag - html
characters -
```

## Installation

The package is [available in Hex](https://hex.pm/packages/sax_html), the package can be installed by adding `sax_html` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:sax_html, "~> 0.1.0"}
  ]
end
```

