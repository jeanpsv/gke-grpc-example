defmodule ElixirGrpcExampleTest do
  use ExUnit.Case
  doctest ElixirGrpcExample

  test "greets the world" do
    assert ElixirGrpcExample.hello() == :world
  end
end
