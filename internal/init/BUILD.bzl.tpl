load("@rules_acx_tools//:def.bzl", "acx_toolchain")

exports_files(["promtool", "levant", "nomad"])

acx_toolchain(
  name = "toolchain_impl",
  promtool = "promtool",
  levant = "levant",
  nomad = "nomad",
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
