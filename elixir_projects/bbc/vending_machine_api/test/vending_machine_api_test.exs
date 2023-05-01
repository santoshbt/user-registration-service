defmodule VendingMachineApiTest do
  use ExUnit.Case
  doctest VendingMachineApi

  test "greets the world" do
    assert VendingMachineApi.hello() == :world
  end
end
