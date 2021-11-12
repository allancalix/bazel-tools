def _toolchain_impl(ctx):
  toolchain_info = platform_common.ToolchainInfo(
        promtool = ctx.executable.promtool.path,
  )

  return [toolchain_info]

local_toolchain = rule(
    implementation = _toolchain_impl,
    attrs = {
        "promtool": attr.label(
            executable = True,
            allow_files = True,
            cfg = "exec",
            default = Label("@default//:promtool"),
        ),
    },
    doc = "fooobar",
)
