workspace(name = "rules_acx_tools")

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

http_archive(
    name = "com_github_bazelbuild_buildtools",
    strip_prefix = "buildtools-master",
    url = "https://github.com/bazelbuild/buildtools/archive/master.zip",
)

http_archive(
    name = "io_bazel_stardoc",
    sha256 = "c9794dcc8026a30ff67cf7cf91ebe245ca294b20b071845d12c192afe243ad72",
    urls = [
        "https://mirror.bazel.build/github.com/bazelbuild/stardoc/releases/download/0.5.0/stardoc-0.5.0.tar.gz",
        "https://github.com/bazelbuild/stardoc/releases/download/0.5.0/stardoc-0.5.0.tar.gz",
    ],
)

load("@io_bazel_stardoc//:setup.bzl", "stardoc_repositories")

stardoc_repositories()

load("//internal/init:sdk.bzl", "prom_sdk")

prom_sdk(
    name = "tools_darwin_x86",
    arch = "x86",
    os = "darwin",
    platform = "darwin_x86",
)

prom_sdk(
    name = "tools_linux_amd64",
    arch = "x86",
    os = "linux",
    platform = "linux_amd64",
)

register_toolchains(
    "@tools_darwin_x86//:toolchain",
    "@tools_linux_amd64//:toolchain",
)
