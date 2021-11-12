def _toolchain_impl(ctx):
  toolchain_info = platform_common.ToolchainInfo(
        promtool = ctx.executable.promtool,
        levant = ctx.executable.levant,
        nomad = ctx.executable.nomad,
        opa = ctx.executable.opa,
  )

  return [toolchain_info]

toolchain = rule(
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
        "nomad": attr.label(
            executable = True,
            allow_files = True,
            mandatory = True,
            cfg = "exec",
        ),
        "opa": attr.label(
            executable = True,
            allow_files = True,
            mandatory = True,
            cfg = "exec",
        ),
    },
    doc = "fooobar",
)
