defmodule SaxHtml do
  alias SaxHtml.{Tag, ScriptTagFilter}

  def parse(text, fun) do
    text
    |> String.split("")
    |> ScriptTagFilter.filter()
    |> parsy(fun)

   # found tag callback
   # fun.({:start_tag, tag})
  end


  def parsy([], fun), do: nil

  def parsy(text, fun) do
    { tag, text } = Tag.get(text)

    if String.starts_with?(tag, "/") do
      tag = String.trim_leading(tag, "/")
      fun.({:end_tag, tag})
    else
      fun.({:start_tag, tag})
    end

    { chars, text } = get_characters(text)
    fun.({:characters, chars})

    parsy(text, fun)
  end


  def get_characters(text, chars \\ "")
  def get_characters([], chars), do: {chars, []}

  def get_characters([current | text], chars) do
    case current do
      "<" ->
        {chars, [current | text]}
      _ ->
        get_characters(text, chars <> current)
    end
  end
end
