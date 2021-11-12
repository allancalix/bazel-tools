load("@rules_acx_tools//:toolchain.bzl", "local_toolchain")

exports_files(["promtool", "levant"])

local_toolchain(
  name = "toolchain_impl",
  promtool = "promtool",
  levant = "levant",
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
