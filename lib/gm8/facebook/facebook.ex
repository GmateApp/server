defmodule Gm8.Facebook do
  alias Gm8.Facebook.Graph

  def fetch_data(access_token, fields \\ ["email"]) do
    case Graph.get(
           "me",
           [],
           params: %{access_token: access_token, fields: Enum.join(fields, ",")}
         ) do
      {:ok, %{body: %{"error" => error}}} ->
        {:error, error["message"]}

      {:ok, %{body: data}} ->
        {:ok, data}
    end
  end

  def fetch_user(access_token) do
    {:ok, data} =
      fetch_data(access_token, [
        "email",
        "first_name",
        "last_name",
        "gender",
        "picture.width(720).height(720) "
      ])

    {:ok, format_user_data(data)}
  end

  defp format_user_data(data) do
    data
    |> Map.put("picture_url", data["picture"]["data"]["url"])
    |> Map.put("gender", if(data["gender"] == "male", do: 1, else: 0))
    |> Map.drop(["id", "picture"])
  end
end
