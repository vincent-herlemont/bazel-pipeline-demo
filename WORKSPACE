workspace(
    name = "pipeline_demo",
    managed_directories = {
        "@npm_web": ["./web/node_modules"],
        "@npm_graphql": ["./graphql/node_modules"],
    },
)

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

# DOCKER
http_archive(
    name = "io_bazel_rules_docker",
    sha256 = "1698624e878b0607052ae6131aa216d45ebb63871ec497f26c67455b34119c80",
    strip_prefix = "rules_docker-0.15.0",
    urls = ["https://github.com/bazelbuild/rules_docker/releases/download/v0.15.0/rules_docker-v0.15.0.tar.gz"],
)

load(
    "@io_bazel_rules_docker//repositories:repositories.bzl",
    container_repositories = "repositories",
)

container_repositories()

load("@io_bazel_rules_docker//repositories:deps.bzl", container_deps = "deps")

container_deps()

load(
    "@io_bazel_rules_docker//container:container.bzl",
    "container_pull",
)

container_pull(
    name = "node",
    registry = "index.docker.io",
    repository = "node",
    tag = "15.3.0-alpine3.12",
    digest = "sha256:ef59ec90488721c328840859aea0d6992601f8767d5772985026fbcf648a7a41",
)

container_pull(
    name = "ubuntu20",
    registry = "index.docker.io",
    repository = "ubuntu",
    tag = "20.10",
    digest = "sha256:c41e8d2a4ca9cddb4398bf08c99548b9c20d238f575870ae4d3216bc55ef3ca7",
)

container_pull(
    name = "postgres",
    registry = "index.docker.io",
    repository = "postgres",
    tag = "13.1",
    digest = "sha256:87826486f735951c5453841f59dd966b46e69d2faf2c36045c1cdf85d694a695",
)

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

# Go
http_archive(
    name = "io_bazel_rules_go",
    sha256 = "207fad3e6689135c5d8713e5a17ba9d1290238f47b9ba545b63d9303406209c6",
    urls = [
        "https://mirror.bazel.build/github.com/bazelbuild/rules_go/releases/download/v0.24.7/rules_go-v0.24.7.tar.gz",
        "https://github.com/bazelbuild/rules_go/releases/download/v0.24.7/rules_go-v0.24.7.tar.gz",
    ],
)

http_archive(
    name = "bazel_gazelle",
    sha256 = "b85f48fa105c4403326e9525ad2b2cc437babaa6e15a3fc0b1dbab0ab064bc7c",
    urls = [
        "https://mirror.bazel.build/github.com/bazelbuild/bazel-gazelle/releases/download/v0.22.2/bazel-gazelle-v0.22.2.tar.gz",
        "https://github.com/bazelbuild/bazel-gazelle/releases/download/v0.22.2/bazel-gazelle-v0.22.2.tar.gz",
    ],
)

load("@io_bazel_rules_go//go:deps.bzl", "go_register_toolchains", "go_rules_dependencies")
load("@bazel_gazelle//:deps.bzl", "gazelle_dependencies", "go_repository")

go_repository(
    name = "com_github_streadway_amqp",
    importpath = "github.com/streadway/amqp",
    sum = "h1:kuuDrUJFZL1QYL9hUNuCxNObNzB0bV/ZG5jV3RWAQgo=",
    version = "v1.0.0",
)

go_rules_dependencies()

go_register_toolchains()

gazelle_dependencies()

# Go (docker image)
load(
    "@io_bazel_rules_docker//go:image.bzl",
    _go_image_repos = "repositories",
)

_go_image_repos()

# K8S
http_archive(
    name = "io_bazel_rules_k8s",
    sha256 = "773aa45f2421a66c8aa651b8cecb8ea51db91799a405bd7b913d77052ac7261a",
    strip_prefix = "rules_k8s-0.5",
    urls = ["https://github.com/bazelbuild/rules_k8s/archive/v0.5.tar.gz"],
)

load("@io_bazel_rules_k8s//k8s:k8s.bzl", "k8s_repositories")

k8s_repositories()

load("@io_bazel_rules_k8s//k8s:k8s_go_deps.bzl", k8s_go_deps = "deps")

k8s_go_deps()

# PYTHON
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

http_archive(
    name = "rules_python",
    url = "https://github.com/bazelbuild/rules_python/releases/download/0.1.0/rules_python-0.1.0.tar.gz",
    sha256 = "b6d46438523a3ec0f3cead544190ee13223a52f6a6765a29eae7b7cc24cc83a0",
)

load("@rules_python//python:pip.bzl", "pip_install")

pip_install(
    name = "util_deps",
    requirements = "//util:requirements.txt",
)

pip_install(
    name = "util_tools_deps",
    requirements = "//util/tools:requirements.txt",
)

# JS
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

http_archive(
    name = "build_bazel_rules_nodejs",
    sha256 = "452bef42c4b2fbe0f509a2699ffeb3ae2c914087736b16314dbd356f3641d7e5",
    urls = ["https://github.com/bazelbuild/rules_nodejs/releases/download/2.3.0/rules_nodejs-2.3.0.tar.gz"],
)

load("@build_bazel_rules_nodejs//:index.bzl", "npm_install")

npm_install(
    name = "npm_front",
    package_json = "//front:package.json",
    package_lock_json = "//front:package-lock.json",
)

npm_install(
    name = "npm_web",
    package_json = "//web:package.json",
    package_lock_json = "//web:package-lock.json",
)

npm_install(
    name = "npm_graphql",
    package_json = "//graphql:package.json",
    package_lock_json = "//graphql:package-lock.json",
)

# JS (docker image)
load(
    "@io_bazel_rules_docker//nodejs:image.bzl",
    _nodejs_image_repos = "repositories",
)

_nodejs_image_repos()

# Rust
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

http_archive(
    name = "io_bazel_rules_rust",
    sha256 = "b5d4d1c7609714dfef821355f40353c58aa1afb3803401b3442ed2355db9b0c7",
    strip_prefix = "rules_rust-8d2b4eeeff9dce24f5cbb36018f2d60ecd676639",
    urls = [
        "https://github.com/bazelbuild/rules_rust/archive/8d2b4eeeff9dce24f5cbb36018f2d60ecd676639.tar.gz",
    ],
)

load("@io_bazel_rules_rust//rust:repositories.bzl", "rust_repositories")

rust_repositories(
    version = "1.48.0",
    edition = "2018",
)

load("@io_bazel_rules_rust//:workspace.bzl", "rust_workspace")

rust_workspace()

load("//consumer/cargo:crates.bzl", "raze_fetch_remote_crates")

raze_fetch_remote_crates()

# Rust (docker image)
load(
    "@io_bazel_rules_docker//rust:image.bzl",
    _rust_image_repos = "repositories",
)

_rust_image_repos()


# TODO: test tyy
load("@pipeline_demo//util/ytt:repository.bzl","ytt_tool")

ytt_tool(
    name = "ytt_tool",
)