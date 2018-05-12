defmodule Gm8Web.Router do
  use Gm8Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", Gm8Web do
    pipe_through :api

    post "/authentication", UserController, :auth
  end
end
