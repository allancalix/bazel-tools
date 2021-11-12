load("@rules_acx_tools//:def.bzl", "acx_toolchain")

exports_files(["promtool", "levant"])

acx_toolchain(
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
