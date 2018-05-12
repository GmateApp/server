defmodule Gm8.Util do
  def snake_case_keys(map) do
    for {key, value} <- map, into: %{}, do: {Inflex.underscore(key), value}
  end
end
