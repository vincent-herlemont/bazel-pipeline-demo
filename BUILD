load("@bazel_gazelle//:def.bzl", "gazelle")

# gazelle:prefix github.com/vincent-herlemont/pipeline-demo
gazelle(name = "gazelle")

# Create ingress k8s
load("@io_bazel_rules_k8s//k8s:object.bzl", "k8s_object")

k8s_object(
    name = "ingress",
    cluster = "minikube",
    kind = "Ingress",
    template = "ingress.yaml",
)

load("@io_bazel_rules_k8s//k8s:objects.bzl", "k8s_objects")

k8s_objects(
    name = "jobs",
    objects = [
        "//sensor:job",
    ],
)

k8s_objects(
    name = "apps",
    objects = [
        "//postgresql:app",
        "//dispatcher:app",
        "//web:app",
    ],
)

k8s_objects(
    name = "all",
    objects = [
        ":ingress",
        ":apps",
        ":jobs",
    ],
)