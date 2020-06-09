defmodule SdoPhoenix.Web.Endpoint do
  use Phoenix.Endpoint, otp_app: :sdo_phoenix

  # The session will be stored in the cookie and signed,
  # this means its contents can be read but not tampered with.
  # Set :encryption_salt if you would also like to encrypt it.
  @session_options [
    store: :cookie,
    key: "_sdo_phoenix_key",
    signing_salt: "6zHqErPk"
  ]

  socket "/socket", SdoPhoenix.Web.UserSocket,
    websocket: true,
    longpoll: false

  socket "/live", Phoenix.LiveView.Socket, websocket: [connect_info: [session: @session_options]]

  # Serve at "/" the static files from "priv/static" directory.
  #
  # You should set gzip to true if you are running phx.digest
  # when deploying your static files in production.
  plug Plug.Static,
    at: "/",
    from: :sdo_phoenix,
    gzip: false,
    only: ~w(css fonts images js favicon.ico robots.txt)

  # Code reloading can be explicitly enabled under the
  # :code_reloader configuration of your endpoint.
  if code_reloading? do
    socket "/phoenix/live_reload/socket", Phoenix.LiveReloader.Socket
    plug Phoenix.LiveReloader
    plug Phoenix.CodeReloader
    plug Phoenix.Ecto.CheckRepoStatus, otp_app: :sdo_phoenix
  end

  plug Phoenix.LiveDashboard.RequestLogger,
    param_key: "request_logger",
    cookie_key: "request_logger"

  plug Plug.RequestId
  plug Plug.Telemetry, event_prefix: [:phoenix, :endpoint]

  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Phoenix.json_library()

  plug Plug.MethodOverride
  plug Plug.Head
  plug Plug.Session, @session_options
  plug SdoPhoenix.Web.Router

  defmodule SecurityHeaderHandler do
    @behaviour :cowboy_stream

    @csp_name "content-security-policy"
    @csp_value "default-src 'self';"

    @xcto_name "x-content-type-options"
    @xcto_value "nosniff"

    def info(id, {:response, status, headers, body}, state) do
      new_headers =
        headers
        Map.put_new(@csp_name, @csp_value)
        Map.put_new(@xcto_name, @xcto_value)
      :cowboy_stream.info(id, {:response, status, new_headers, body}, state)
    end

    def info(id, info, state) do
      :cowboy_stream.info(id, info, state)
    end

    def init(id, req, opts) do
      :cowboy_stream.init(id, req, opts)
    end

    def data(id, is_fin, info, state) do
      :cowboy_stream.data(id, is_fin, info, state)
    end

    def early_error(id, reason, partial_req, resp, opts) do
      :cowboy_stream.early_error(id, reason, partial_req, resp, opts)
    end

    def terminate(id, reason, state) do
      :cowboy_stream.terminate(id, reason, state)
    end
  end
end
