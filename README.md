# Install

- Install [bazel](https://docs.bazel.build/versions/master/install.html)

- Build all `$> bazel build //:all`

## Get started (locally)

- Start a local docker registry
```bash
docker run -d -p 5000:5000 --name registry registry:2
```

- Install [minikube](https://minikube.sigs.k8s.io/docs/start/) and [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/)

- Start minikube with insecure docker registry (local registry)
```bash
minikube start --insecure-registry "docker.local:5000"
```
- Go inside minikube with `$> minikube ssh`. We have to allow services inside minikube to reach `docker.local:5000`.
  - Install vim `$> sudo apt update && sudo apt install -y vim`
  - Edit `sudo vim /etc/hosts`
  - Add `docker.local` entry with the ip of the host `host.minikube.internal`
    - Entry example : `192.168.49.1    docker.local`
  - /!\ You must do it after each time that minikube start.

- Add ingress addon `$> minikube addons enable ingress`. Ingress allow to reach http services inside k8s.

- Open the dashboard with `$> minikube dashboard`. This web app allow to display the big picture of the k8s state.

- Run all `bazel run //:apps.apply`

- Reach [nginx-ingress](./ingress.yaml) IP, the entry point of all applications.

```bash
# Command :
$> kubectl get ingress nginx-ingress
# Ouput : 
NAME            CLASS    HOSTS   ADDRESS        PORTS   AGE
nginx-ingress   <none>   *       192.168.49.2   80      13m
``` 

- Test 
```bash
# Command :
$> curl http://192.168.49.2
# Ouput : 
Golang server !!
``` 

# TODO

- [X] (go,bazel) connect to golang app server
- [X] (k8s) set up statefull postgresql

- [x] (python,bazel,k8s) Test ? / Integration test
- [ ] (go,bazel) Unit test
- [ ] (bazel) Run all test

- [ ] (k8s) set up stateless rabbitmq
- [ ] (go,bazel) connect to golang app server
- [ ] (k8s) add rabbitmq manager to ingress

- [ ] (bazel,k8s,js) JS client
- [ ] (bazel,k8s,rust) Rust Jobs (consume mqp message)

# Drawing

- Client1 Go : Capteur send data to Service1.
- Client2 JS : Display DATA
- Server1 JS(node) : Display form postgress
- Service1 Go : Wait data from Client1 and send them to rabbitmqp.
- Service2 Rust : Retrieved from rabbitmqp make store to Postgress.

# Tests

- Requirements `google-auth`, install with command `pip install google-auth`

- Run tests `bazel run //test:test`

# Utils

## Stern

[Stern](https://github.com/wercker/stern) display pod log, example `stern <podname>`.

