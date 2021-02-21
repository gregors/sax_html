defmodule SaxHtmlTest do
  use ExUnit.Case

  @text """
    <html boom="pow" >
      <head>
        <title>My Title</title>
        <script>
        for(int i=0; i<10 & i>-1; i++) {
          console.log("boom");
  }
        </script>
      </head>
      <body>
       <div><p>hello</p><br /><br>Boom</br></div>
      </body>
    </html>
  """

  test "example run without state" do
    fun = fn
      { :characters, chars, _state} ->  IO.inspect(chars)
      _ -> nil
    end

    SaxHtml.parse(@text, fun)
  end

  test "start event" do
    fun = fn
#      { :start_tag, _tag} -> tag |> String.upcase |> IO.inspect()
#      { :end_tag, _tag} -> tag |> String.upcase |> IO.inspect()
      { :characters, chars, state} ->
        if String.match?(chars, ~r/[\n\s]+/) do
          state
        else
          [ chars | state ]
        end
      { _, _, state} -> state
    end

    output = SaxHtml.parse(@text, fun) |> Enum.join("")
    assert output == "Boomhello"
  end

  test "events take state" do
    fun = fn
      { :characters, _chars, state} ->  [:event | state ]
      { _, _, state} -> state
    end

    output = SaxHtml.parse(@text, fun, [])
    assert length(output) == 15
  end
end
