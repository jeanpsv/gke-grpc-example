# gke-grpc-example
Google Kubernetes Engine gRPC Example

### Helm installation

Use that command to install:
```bash
$ helm install stable/traefik --name traefik --namespace traefik --values ./helm/values.yaml
```

and that to update:
```bash
$ helm upgrade traefik stable/traefik --values ./helm/values.yaml --wait
```

### Application Example

- kubectl create namespace apps
- kubectl apply -f kubernetes/cheese-cheddar-deployment.yaml
- kubectl apply -f kubernetes/cheese-stiltion-deployment.yaml
- kubectl apply -f kubernetes/cheese-wensleydale-deployment.yaml
- kubectl apply -f kubernetes/cheese-ingress.yaml

```bash
$ curl --header "Host:cheddar.service" ${traefik-external-ip}
```
ps: run `kubectl get svc -n traefik` to see external ip.
