const grpc = require("grpc")
const protoLoader = require("@grpc/proto-loader")

const protoPath = require("path").join(__dirname, "../", "protobufs")

const packageDefinition = protoLoader.loadSync(`${protoPath}/greeter.proto`, {
  keepCase: true,
  longs: String,
  enums: String,
  defaults: true,
  oneofs: true
})
const protoDescriptor = grpc.loadPackageDefinition(packageDefinition)

const host = process.env.GREETER_HOST
const port = process.env.GREETER_PORT

const GreeterService = new protoDescriptor.greeter.Greeter(`${host}:${port}`, grpc.credentials.createInsecure())

GreeterService.hello({
	name: "Darth Vader"
}, (error, response) => {
  if (error) {
    console.log(error)
    return
  }

  console.log(response)
})
