defmodule SaxHtml.ScriptTagFilter do
  def filter(text) do
    filter(text, []) |> Enum.reverse
  end

  def filter(["<", "s", "c", "r", "i", "p", "t" | text], filtered_text) do
    text = skip_until_end(text)
    filter(text, filtered_text)
  end

  def filter([], filtered_text), do: filtered_text

  def filter([char | text], filtered_text) do
    filter(text, [char | filtered_text ])
  end

  def skip_until_end([]), do: []
  def skip_until_end( ["<", "/", "s", "c", "r", "i", "p", "t", ">" | text]), do: text
  def skip_until_end([_current | text]), do: skip_until_end(text)
end
