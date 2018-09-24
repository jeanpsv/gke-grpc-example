$LOAD_PATH.unshift(File.expand_path(File.dirname(__FILE__)))

require 'grpc'
require 'greeter_services_pb'

def main
  host = ENV["SERVER_HOST"]
  port = ENV["SERVER_PORT"]

  stub = Greeter::Greeter::Stub.new("#{host}:#{port}", :this_channel_is_insecure)

  response = stub.hello(Greeter::Person.new(name: "Padme"))
  p response
end


main()
