defmodule Bob do
  def hey(input) do
    string_input = input |> to_string

    isShouting = fn (string) ->
      Regex.match?(~r/\p{Lu}/, string) && String.upcase(string) == string
    end

    cond do
      String.ends_with?(string_input, "?") ->
        "Sure."
      isShouting.(string_input) ->
        "Whoa, chill out!"
      !Regex.match?(~r/[\d+\w+]/, string_input) ->
        "Fine. Be that way!"
      true ->
        "Whatever."
    end
  end
end
