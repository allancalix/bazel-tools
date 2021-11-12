load("@rules_acx_tools//:toolchain.bzl", "local_toolchain")

exports_files(["promtool"])

local_toolchain(
  name = "toolchain_impl",
  promtool = "promtool",
)

toolchain(
    name = "toolchain",
    exec_compatible_with = [
        {constraints}
    ],
    target_compatible_with = [
        {constraints}
    ],
    toolchain = ":toolchain_impl",
    toolchain_type = "@rules_acx_tools//:toolchain_type",
)
