defmodule VendingMachine.MachineWorker do
  use GenServer

  def start_link(args) do
    GenServer.start_link(__MODULE__, args, name: __MODULE__)
  end

  def init(state) do
    {:ok, state}
  end
end
