defmodule Greeter.Human do
  use Protobuf

  @type t :: %__MODULE__{
    name: String.t()
  }
  defstruct [:name]

  field :name, 1, optional: true, type: :string
end

defmodule Greeter.Greeting do
  use Protobuf

  @type t :: %__MODULE__{
    message: String.t()
  }
  defstruct [:message]

  field :message, 1, optional: true, type: :string
end

defmodule Greeter.GreeterService.Service do
  use GRPC.Service, name: "greeter.GreeterService"

  rpc :Hello, Greeter.Human, Greeter.Greeting
end

defmodule Greeter.GreeterService.Stub do
  use GRPC.Stub, service: Greeter.GreeterService.Service
end
