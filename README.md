

# Goal

<img align="left" width="200" src="doc/img/bazel.png">

Provide a full example with bazel and multi-languages of a simple data pipeline with sensors, consumers, queues, dispatchers, databases, api, front.
The choices of languages and technology apart from bazel are arbitrary.

<br />
<br />

 - Live Demo <br />

<img align="left" width="100" src="doc/img/scaleway.png">

[8631fdac-7d58-45ac-974f-c0f2171ac1a2.nodes.k8s.fr-par.scw.cloud](http://8631fdac-7d58-45ac-974f-c0f2171ac1a2.nodes.k8s.fr-par.scw.cloud/)

<p align="center">
  <a href="http://8631fdac-7d58-45ac-974f-c0f2171ac1a2.nodes.k8s.fr-par.scw.cloud/"><img width="100%" src="doc/img/screen-pipeline-demo.png"></a>
</p>

# Services

Each service corresponds to a folder at the root repository. 

<img align="left" width="50%" src="doc/img/data-stream.png">

- `./senror` Go : Send an random number to dispatcher.

- `./dispatcher` Go : Wait data from sensor(s) and send them to rabbitmqp.

- `./rabbitmq` Rabbitmq services

- `./consumer` Rust : Retrieved from rabbitmqp store data to Postgresql.

- `./postgresql` Postgresql services

- `./graphql` Node/Apollo : Create api from Postgresql data.

- `./web` (JS & Node) : Display data from graphql endpoint. (Can be outsourced of the cluster, hosted by Vercel for example).

<br /><br /><br />
<br /><br /><br />
<br /><br /><br />

## Bazel one command for all code deliveries steps.

Bazel allow to describe and bring together all steps of code delivery 
with multiple languages.

<p align="center">
  <a href="#"><img width="80%" src="doc/img/from-code-tun.png"></a>
</p>

# Install

- Install [bazel](https://docs.bazel.build/versions/master/install.html) and [ibazel](https://github.com/bazelbuild/bazel-watcher) for live reload.

Add this env variables to your `.bashrc` or `.profil` or others init shell file.

```bash
export REGISTRY=docker.local:5000/pipeline-demo
export CLUSTER=minikube
export REGISTRY_AUTH=False
```

- Build all `$> bazel build //...`

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
  - ⚠️ You must do it after each time that minikube start.

- Add ingress addon `$> minikube addons enable ingress`. Ingress allow to reach http services inside k8s.

- Open the dashboard with `$> minikube dashboard`. This web app allow to display the big picture of the k8s state.

- Run all `bazel run //:all.create`

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
Golang dispatcher !!
```


## Tests

- Requirements `google-auth`, install with command `pip install google-auth`

- Run tests `bazel test //...`

Test **live** (use `ibazel`) and **debug** (use `--test_output=all`)
```bash
# Example with dispatcher
ibazel test //dispatcher:test --test_output=all
```

## Development

Build, deploy and test (unit, and integration test)
```
bazel run //:apps.apply && bazel test //...
```

Need more faster 🚀! You can restrict the scope of build and deployment.
Example by deploying only the dispatcher.
```bash
bazel run //dispatcher:app.apply && bazel test //...
```
You can also restrict tests.
Example by executing only dispatcher unit tests.
```bash
bazel run //dispatcher:app.apply && bazel test //dispatcher:test
```

- Development front standalone. Use NextJS with endpoint mapping from localcluster.
```
$> ./web/run.sh
...
ready - started server on http://localhost:3000
...
```

### Rust

Add dependencies
- Add dependecies to `Cargo.toml`
- Run `cargo raze` in the package folder

### Go 

Add dependencies
- Add dependencies to `go.mod`
- Run `bazel run //:gazelle -- update-repos -from_file=<service directory>/go.mod`

## Tools

### Log 

Local/Remote stream log : [Stern](https://github.com/wercker/stern) display pod log, example `stern <podname>`.

### Cli

Package `//util/tools` provide some shortcuts for get service urls or cluster urls in development mode. 
```bash
$> cd <project WORKSPACE path>
$> bazel build //util/tools
$> ./bazel-bin/util/tools/tools
Usage: tools.py [OPTIONS] COMMAND [ARGS]...

Options:
  --help  Show this message and exit.

Commands:
  get-cluster-url
  get-service-url
```

## Troubleshooting

### JS

Lock file update and generation have to do manually, emaple with `front` package.
```bash
cd ./front/
npm i --package-lock-only
```