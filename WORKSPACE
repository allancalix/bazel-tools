load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

http_archive(
    name = "io_bazel_rules_go",
    sha256 = "2b1641428dff9018f9e85c0384f03ec6c10660d935b750e3fa1492a281a53b0f",
    urls = [
        "https://mirror.bazel.build/github.com/bazelbuild/rules_go/releases/download/v0.29.0/rules_go-v0.29.0.zip",
        "https://github.com/bazelbuild/rules_go/releases/download/v0.29.0/rules_go-v0.29.0.zip",
    ],
)

http_archive(
    name = "bazel_gazelle",
    sha256 = "bc60b9ec67a77c7ce8199373c6d55d849491235b77f623932e6c62b4bed11c50",
    strip_prefix = "bazel-gazelle-b1e37463c2ef0997c5cf0e90cdf03e696caaed27",
    urls = [
        "https://github.com/bazelbuild/bazel-gazelle/archive/b1e37463c2ef0997c5cf0e90cdf03e696caaed27.tar.gz",
    ],
)

load("@io_bazel_rules_go//go:deps.bzl", "go_register_toolchains", "go_rules_dependencies")

go_rules_dependencies()

go_register_toolchains(version = "1.17.1")

load("@bazel_gazelle//:deps.bzl", "gazelle_dependencies")

gazelle_dependencies()

load("//:go_deps.bzl", "go_vendor")

# gazelle:repository_macro go_deps.bzl%go_vendor
go_vendor()

register_toolchains(
    "//:barc_darwin_toolchain",
)

load(":sdk.bzl", "prom_sdk")

prom_sdk()
