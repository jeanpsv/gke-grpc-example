$LOAD_PATH.unshift(File.expand_path(File.dirname(__FILE__)))

require 'grpc'
require 'greeter_services_pb'

class GreeterService < Greeter::Greeter::Service
  def hello(request, _call)
    my_name = ENV["MY_NAME"]

    Greeter::Greeting.new(message: "Hello #{request.name} I am #{my_name}")
  end
end

def main
  p "gRPC server running"

  port = ENV["SERVER_PORT"]

  server = GRPC::RpcServer.new
  server.add_http2_port("0.0.0.0:#{port}", :this_port_is_insecure)
  server.handle(GreeterService.new)
  server.run_till_terminated
end

main()
