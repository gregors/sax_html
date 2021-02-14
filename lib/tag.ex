defmodule SaxHtml.Tag do
  def get(["<" | text]) do
    get_tag_name("", text)
  end

  # skip chars before start of tag
  def get([_current | text]), do: get(text)

  def get_tag_name(tag, [current | text]) do
    case current do
      ">" -> {tag, text}
      " " -> { tag, text |> skip_until_end }
      _ -> get_tag_name(tag <> current, text)
    end
  end

  def skip_until_end([]), do: []
  def skip_until_end([">" | text]), do: text
  def skip_until_end([_current | text]), do: skip_until_end(text)
end
