def _prom_test_impl(ctx):
    cmd = " ".join([
      ctx.toolchains["//:toolchain_type"].promtool.path,
      "test",
      "rules",
    ] + [f.path for f in ctx.files.srcs])

    ctx.actions.write(
      output = ctx.outputs.executable,
      content = cmd,
    )

    runfiles = ctx.files.srcs + ctx.files.rules + [
      ctx.toolchains["//:toolchain_type"].promtool,
    ]
    return [DefaultInfo(runfiles = ctx.runfiles(runfiles))]

prom_test = rule(
    implementation = _prom_test_impl,
    test = True,
    attrs = {
        "srcs": attr.label_list(allow_files = True),
        "rules": attr.label_list(allow_files = True),
    },
    toolchains = ["//:toolchain_type"],
)
