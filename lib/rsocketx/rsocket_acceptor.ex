defmodule RSocketx.RSocketAcceptor do
  @moduledoc """
  RSocket Acceptor.
  """
  alias RSocketx.Payload

  @type payload :: Payload

  @type stream_payload :: Stream.t()

  @callback handle_fire_and_forget(payload()) :: any()

  @callback handle_request_response(payload()) :: payload()

  @callback handle_request_stream(payload()) :: stream_payload()

  @callback handle_request_channel(stream_payload()) :: stream_payload()

  @optional_callbacks handle_fire_and_forget: 1,
                      handle_request_response: 1,
                      handle_request_stream: 1,
                      handle_request_channel: 1

  defmacro __using__(opts) do
    quote bind_quoted: [opts: opts] do
      @behaviour RSocketx.RSocketAcceptor
      require Logger

      @before_compile RSocketx.RSocketAcceptor
    end
  end

  defmacro __before_compile__(_env) do
    quote do
      @spec handle_fire_and_forget(payload()) :: any()
      def handle_fire_and_forget(_), do: Logger.debug("Received an fire and forget message")

      @spec handle_request_response(payload()) :: payload()
      def handle_request_response(_), do: Logger.debug("Received an request response message")

      @spec handle_request_stream(payload()) :: stream_payload()
      def handle_request_stream(_), do: Logger.debug("Received an request stream message")

      @spec handle_request_channel(stream_payload()) :: stream_payload()
      def handle_request_channel(_), do: Logger.debug("Received an request channel message")
    end
  end
end
