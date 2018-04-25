defmodule A.Worker do
  use GenServer, shutdown: 30_000

  def init(_) do
    Process.flag(:trap_exit, true)
    {:ok, []}
  end

  def start_link(_) do
    GenServer.start_link(__MODULE__, [], [name: __MODULE__])
  end

  def terminate(:shutdown, _state) do
    IO.puts "Received :shutdown, delaying for 10_000"
    Process.sleep(10_000)
    B.Worker.clean_up() |> IO.inspect
    IO.inspect "shutting down now..."
    :ok
  end
end
