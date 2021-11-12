workspace(name = "rules_acx_tools")

load("//internal/init:sdk.bzl", "prom_sdk")

prom_sdk(
  name = "tools_darwin_x86",
  platform = "darwin_x86",
  os = "darwin",
  arch = "x86",
)

prom_sdk(
  name = "tools_linux_amd64",
  platform = "linux_amd64",
  os = "linux",
  arch = "x86",
)

register_toolchains(
    "@tools_darwin_x86//:toolchain",
    "@tools_linux_amd64//:toolchain",
)
