defmodule Gm8Web do
  @moduledoc """
  The entrypoint for defining your web interface, such
  as controllers, views, channels and so on.

  This can be used in your application as:

      use Gm8Web, :controller
      use Gm8Web, :view

  The definitions below will be executed for every view,
  controller, etc, so keep them short and clean, focused
  on imports, uses and aliases.

  Do NOT define functions inside the quoted expressions
  below. Instead, define any helper function in modules
  and import those modules here.
  """

  def controller do
    quote do
      use Phoenix.Controller, namespace: Gm8Web
      import Plug.Conn
      import Gm8Web.Router.Helpers
      import Gm8Web.Gettext
    end
  end

  def view do
    quote do
      use Phoenix.View, root: "lib/gm8_web/templates",
                        namespace: Gm8Web

      # Import convenience functions from controllers
      import Phoenix.Controller, only: [get_flash: 2, view_module: 1]

      import Gm8Web.Router.Helpers
      import Gm8Web.ErrorHelpers
      import Gm8Web.Gettext
    end
  end

  def router do
    quote do
      use Phoenix.Router
      import Plug.Conn
      import Phoenix.Controller
    end
  end

  def channel do
    quote do
      use Phoenix.Channel
      import Gm8Web.Gettext
    end
  end

  @doc """
  When used, dispatch to the appropriate controller/view/etc.
  """
  defmacro __using__(which) when is_atom(which) do
    apply(__MODULE__, which, [])
  end
end
