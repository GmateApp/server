defmodule Gm8.Facebook do
  alias Gm8.Facebook.Graph

  def fetch_data(access_token, fields \\ ["email"]) do
    case Graph.get("me", [], params: %{access_token: access_token, fields: Enum.join(fields, ",")}) do
      {:ok, %{body: %{"error" => error}}} ->
        {:error, error["message"]}

      {:ok, %{body: data}} ->
        {:ok, data}
    end
  end

  def fetch_user(access_token) do
    fetch_data(
      access_token,
      ["email", "first_name", "last_name", "gender", "picture.width(720).height(720) "]
    )
  end
end
