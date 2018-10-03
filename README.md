# gke-grpc-example
Google Kubernetes Engine gRPC Example

### Traefik installation

1. kubectl create namespace traefik
2. kubectl apply -f kubernetes/traefik-clusterrole.yaml
3. kubectl apply -f kubernetes/traefik-serviceaccount.yaml
4. kubectl apply -f kubernetes/traefik-clusterrolebinding.yaml
5. kubectl apply -f kubernetes/traefik-deployment.yaml
6. kubectl apply -f kubernetes/traefik-service.yaml
7. kubectl apply -f kubernetes/traefik-webui-service.yaml

### Application Example

1. kubectl create namespace apps
2. kubectl apply -f kubernetes/app-cheddar.yaml -n apps
3. kubectl apply -f kubernetes/app-stiltion.yaml -n apps
4. kubectl apply -f kubernetes/app-wensleydale.yaml -n apps
5. kubectl apply -f kubernetes/app-ingress.yaml -n apps

```bash
$ curl --header "Host:cheddar.service" ${traefik-external-ip}
```
