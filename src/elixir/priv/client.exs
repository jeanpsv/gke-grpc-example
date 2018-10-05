host = System.get_env("SERVER_HOST")
port = System.get_env("SERVER_PORT")
{:ok, channel} = GRPC.Stub.connect("#{host}:#{port}")
human =
  %{name: "Jean Vasconcelos"}
  |> Greeter.Human.new()
{:ok, reply} =
  channel
  |> Greeter.GreeterService.Stub.hello(human)
IO.inspect reply
