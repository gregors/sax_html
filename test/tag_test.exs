defmodule SaxHtml.TagTest do
  use ExUnit.Case

  test "tag/1" do
    text = """
    <html boom="pow" >
    """
    |> String.split("")

    assert SaxHtml.Tag.get(text) ==  { "html", ["\n", ""] }
  end
end
