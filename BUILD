toolchain_type(name = "toolchain_type")

load("toolchain.bzl", "local_toolchain")

local_toolchain(
    name = "barc_darwin"
)

toolchain(
    name = "barc_darwin_toolchain",
    exec_compatible_with = [
        "@platforms//os:macos",
        "@platforms//cpu:x86_64",
    ],
    target_compatible_with = [
        "@platforms//os:macos",
        "@platforms//cpu:x86_64",
    ],
    toolchain = ":barc_darwin",
    toolchain_type = ":toolchain_type",
)

load("@bazel_gazelle//:def.bzl", "gazelle")

# gazelle:prefix github.com/acx-dev/bazel-tools
# gazelle:build_file_name BUILD
gazelle(name = "gazelle")
