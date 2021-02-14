defmodule SaxHtmlTest do
  use ExUnit.Case

  test "start event" do
    text = """
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

    fun = fn
#      { :start_tag, _tag} -> tag |> String.upcase |> IO.inspect()
#      { :end_tag, _tag} -> tag |> String.upcase |> IO.inspect()
      { :characters, chars} -> IO.inspect(chars)
      { _, _} -> nil
    end

    SaxHtml.parse(text, fun)
  end
end
