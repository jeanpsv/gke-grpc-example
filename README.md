# gke-grpc-example
Google Kubernetes Engine gRPC Example

### Helm installation

Use that command to install:
```bash
$ helm install stable/traefik --name traefik --namespace traefik --values ./traefik/values.yaml
```

and that to update:
```bash
$ helm upgrade traefik stable/traefik --values ./traefik/values.yaml --wait
```

### Application example

- kubectl create namespace apps
- kubectl apply -f traefik/cheese-cheddar-deployment.yaml
- kubectl apply -f traefik/cheese-stiltion-deployment.yaml
- kubectl apply -f traefik/cheese-wensleydale-deployment.yaml
- kubectl apply -f traefik/cheese-ingress.yaml

```bash
$ curl --header "Host:cheddar.service" ${traefik-external-ip}
```
ps: run `kubectl get svc -n traefik` to see external ip.


### gRPC application example

```bash
$ docker-compose up greeter-service backend
$ docker-compose up greeter-client
```
