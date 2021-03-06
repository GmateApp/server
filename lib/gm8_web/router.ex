defmodule Gm8Web.Router do
  use Gm8Web, :router

  pipeline :api do
    plug(:accepts, ["json"])
    plug(Gm8.Auth.CurrentUser)
  end

  pipeline :ensure_auth do
    plug(:api)
    plug(Gm8.Auth.EnsureAuth)
  end

  scope "/api", Gm8Web do
    pipe_through(:api)

    post("/authentication", UserController, :auth)
  end

  scope "/api", Gm8Web do
    pipe_through(:ensure_auth)

    scope "/user" do
      get("/", UserController, :index)

      scope "/me" do
        get("/", UserController, :me)
        post("/location", UserController, :update_location)
      end

      get("/:id", UserController, :show)
    end

    scope "/court" do
      get("/", CourtController, :index)
      post("/", CourtController, :create)
      get("/:id", CourtController, :show)
      put("/:id", CourtController, :update)
      delete("/:id", CourtController, :delete)
    end
  end
end
