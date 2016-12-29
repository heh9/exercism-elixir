defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string) do

    abbrev_word = fn (word, sentence) ->
      if String.first(word) === String.downcase(String.first(word)) do
        String.replace(sentence, word, String.capitalize(word))
      else
        sentence
      end
    end

    valid_letter = fn (c) ->
      !String.contains?(" ,-", c) and
      c == String.upcase(c)
    end

    capitalize = fn (sentence) ->
      words = String.split(sentence, " ")
      Enum.reduce(words, sentence, fn(w, res) -> abbrev_word.(w, res) end)
    end

    string
    |> (capitalize.())
    |> String.codepoints
    |> Enum.filter(fn l -> valid_letter.(l) end)
    |> Enum.join
  end
end
