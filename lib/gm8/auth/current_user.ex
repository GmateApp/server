defmodule Gm8.Auth.CurrentUser do
  import Plug.Conn

  def init(opts), do: opts

  def call(conn, _opts) do
    headers = Enum.into conn.req_headers, %{}
    user_id = extract_user_id(headers)

    if user_id do
      user = Gm8.Auth.get_user(user_id)
      assign(conn, :current_user, user)
    else
      assign(conn, :current_user, nil)
    end
  end

  defp extract_user_id(%{"authorization" => "Bearer " <> user_id}), do: user_id
  defp extract_user_id(_headers), do: nil
end
