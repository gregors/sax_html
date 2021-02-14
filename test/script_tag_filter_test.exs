defmodule SaxHtml.ScriptTagFilterTest do
  use ExUnit.Case

  test "filter/1" do
    text = """
    <script>
    for(int i=0; i<10 & i>-1; i++) {
      console.log("boom");
    }
    </script>
    boom<script>
    for(int i=0; i<10 & i>-1; i++) {
      console.log("boom");
    }
    </script>
    """
    |> String.split("")

    assert SaxHtml.ScriptTagFilter.filter(text) ==  ["", "\n", "b", "o", "o", "m", "\n", ""]
  end
end
