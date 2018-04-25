defmodule B.Worker do
  use GenServer

  def init(_) do
    {:ok, []}
  end

  def start_link(_) do
    GenServer.start_link(__MODULE__, [], [name: __MODULE__])
  end

  def clean_up do
    GenServer.call(__MODULE__, :clean_up)
  end

  def handle_call(:clean_up, _from, state) do
    {:reply, "All clean!", state}
  end
end
