defmodule SaxHtml do
  alias SaxHtml.{Tag, ScriptTagFilter}

  def parse(text, fun, state \\ []) do
    final_state = text
                  |> String.split("")
                  |> ScriptTagFilter.filter()
                  |> parsy(fun, state)

    final_state
  end

  def parsy([], fun, state), do: state

  def parsy(text, fun, state) do
    { tag, text } = Tag.get(text)

    state = if String.starts_with?(tag, "/") do
      tag = String.trim_leading(tag, "/")
      fun.({:end_tag, tag, state})
    else
      fun.({:start_tag, tag, state})
    end

    { chars, text } = get_characters(text)
    state = fun.({:characters, chars, state})

    parsy(text, fun, state)
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
