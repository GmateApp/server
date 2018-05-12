defmodule Gm8Web.Router do
  use Gm8Web, :router

  pipeline :api do
    plug(:accepts, ["json"])
    plug(Gm8.Auth.CurrentUser)
  end

  scope "/api", Gm8Web do
    pipe_through(:api)

    post("/authentication", UserController, :auth)

    scope "/user" do
      get("/", UserController, :index)

      scope "/me" do
        get("/", UserController, :me)
      post("/location", UserController, :update_location)
      end
    end
  end
end
