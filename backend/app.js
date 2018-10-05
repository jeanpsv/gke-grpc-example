const express = require("express")
const bodyParser = require("body-parser")
const grpc = require("grpc")
const protoLoader = require("@grpc/proto-loader")

const app = express()
app.use(bodyParser.json())

const host = process.env.GREETER_HOST
const port = process.env.GREETER_PORT

const protoPath = require("path").join(__dirname, "../", "protobufs")
const packageDefinition = protoLoader.loadSync(`${protoPath}/greeter.proto`, {
  keepCase: true,
  longs: String,
  enums: String,
  defaults: true,
  oneofs: true
})
const protoDescriptor = grpc.loadPackageDefinition(packageDefinition)
const GreeterService = new protoDescriptor.greeter.Greeter(`${host}:${port}`, grpc.credentials.createInsecure())


app.post("/hello", (request, response, next) => {
  GreeterService.hello({
    name: request.body.name
  }, (error, resp) => {
    if (error) response.status(500).send(error)
    response.status(200).send(resp)
  })
})

app.listen(4000, () => {
  console.log("NodeJS backend running")
})
