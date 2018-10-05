defmodule ElixirGrpcExample.Greeter.Server do
  use GRPC.Server, service: Greeter.GreeterService.Service

  @spec hello(Greeter.Human.t, GRPC.Server.Stream.t) :: Greeter.Greeting.t
  def hello(%Greeter.Human{name: name} = _human, _stream) do
    %{message: "Hello #{name}"}
    |> Greeter.Greeting.new()
  end
end
