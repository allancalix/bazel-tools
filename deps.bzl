load("@rules_acx_tools//internal/init:sdk.bzl", "prom_sdk")

def acx_register_toolchains():
    prom_sdk(
        name = "tools_darwin_x86",
        arch = "x86",
        os = "darwin",
        platform = "darwin_x86",
    )

    prom_sdk(
        name = "tools_darwin_arm64",
        arch = "arm64",
        os = "darwin",
        platform = "darwin_arm64",
    )

    prom_sdk(
        name = "tools_linux_amd64",
        arch = "x86",
        os = "linux",
        platform = "linux_amd64",
    )

    native.register_toolchains(
        "@tools_darwin_x86//:toolchain",
        "@tools_darwin_arm64//:toolchain",
        "@tools_linux_amd64//:toolchain",
    )
