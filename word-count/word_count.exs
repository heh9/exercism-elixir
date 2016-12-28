defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map
  def count(sentence) do
    # words are separated by ',' and ' ' like in a normal sentence. TESTS  ARE DUMB MKAY ?
    words = String.split(sentence |> to_string, [",", " "]) |> Enum.filter(fn word -> word != "" end)

    words
    |> Enum.into(%{}, fn word -> {word, Enum.count(words, fn w -> w == word end)} end)
  end
end
