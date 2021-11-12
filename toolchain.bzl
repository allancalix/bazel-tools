def _toolchain_impl(ctx):
  toolchain_info = platform_common.ToolchainInfo(
        promtool = ctx.executable.promtool,
        levant = ctx.executable.levant,
  )

  return [toolchain_info]

local_toolchain = rule(
    implementation = _toolchain_impl,
    attrs = {
        "promtool": attr.label(
            executable = True,
            allow_files = True,
            mandatory = True,
            cfg = "exec",
        ),
        "levant": attr.label(
            executable = True,
            allow_files = True,
            mandatory = True,
            cfg = "exec",
        ),
    },
    doc = "fooobar",
)
