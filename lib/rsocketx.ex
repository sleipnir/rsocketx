defmodule RSocketx do
  @moduledoc """
  RSocketx
  """

  defmodule Payload do
    defstruct [
      :has_metadata?,
      :metadata,
      :data,
      :metadata_utf8,
      :data_utf8
    ]

    @type t() :: %__MODULE__{
            has_metadata?: boolean(),
            metadata: binary() | nil,
            data: binary(),
            metadata_utf8: String.t(),
            data_utf8: String.t()
          }
  end
end
