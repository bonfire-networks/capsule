defmodule Entrepot.Storage do
  alias Entrepot.Upload

  @type option :: {atom(), any()}
  @type locator_id :: String.t()

  @callback url(locator_id, [option]) :: binary() | nil
  @callback url(locator_id) :: binary() | nil

  @callback path(locator_id, [option]) :: binary() | nil
  @callback path(locator_id) :: binary() | nil

  @callback read(locator_id, [option]) :: {:ok, binary()} | {:error, String.t()}
  @callback read(locator_id) :: {:ok, binary()} | {:error, String.t()}

  @callback stream(locator_id, [option]) :: IO.Stream.t() | File.Stream.t() | Stream.t()
  @callback stream(locator_id) :: IO.Stream.t() | File.Stream.t() | Stream.t()

  @callback put(Upload.t(), [option]) :: {:ok, locator_id} | {:error, String.t()}
  @callback put(Upload.t()) :: {:ok, locator_id} | {:error, String.t()}

  @callback delete(locator_id, [option]) :: :ok | {:error, String.t()}
  @callback delete(locator_id) :: :ok | {:error, String.t()}
end
