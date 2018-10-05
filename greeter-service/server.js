const grpc = require("grpc")
const protoLoader = require("@grpc/proto-loader")

const protoDescriptor = grpc.loadPackageDefinition(
  protoLoader.loadSync("../protobufs/greeter.proto", {
    keepCase: true,
    longs: String,
    enums: String,
    defaults: true,
    oneofs: true
  })
)

const port = process.env.GREETER_PORT
const my_name = process.env.MY_NAME

const server = new grpc.Server()

server.addService(protoDescriptor.greeter.Greeter.service, {
  hello(call, callback) {
    console.log(call)
    callback(null, {
      message: `Hello ${call.request.name} I am ${my_name}`
    })
  }
})

server.bind(`0.0.0.0:${port}`, grpc.ServerCredentials.createInsecure())

server.start()

console.log("grpc server running")
