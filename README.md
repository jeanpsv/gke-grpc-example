# gke-grpc-example
Google Kubernetes Engine gRPC Example

### Traefik Helm installation

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


### gRPC on Google Kubernetes Engine

First, set a real domain for `greeter-service` application:
1. `greeter-service/kubernetes/ingress.yaml` (set host value)
2. `backend/kubernetes/deployment.yaml` (set GREETER_HOST value)

Now, to the same for `backend` applicaton:
1.`backend/kubernetes/ingress.yaml` (set host value)

Now, deploy the recipes on kubernetes:
```bash
$ kubernetes create ns apps # create namespace "apps"
$ kubernetes -f greeter-service/kubernetes # deploy greeter service application
$ kubernetes -f backend/kubernetes # deploy backend application
```

Send a request to backend using its domain:
curl -X POST backend.
```bash
curl -X POST \
    http://my.backend.domain.com/hello \
    -H 'Content-Type: application/json' \
    -d '{"name": "My Awesome Name"}'
```

replace `my.backend.domain.com` for a real one and make the request.

You will see `Hello My Awesome Name` as the response.
