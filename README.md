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

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `sax_html` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:sax_html, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/sax_html](https://hexdocs.pm/sax_html).

