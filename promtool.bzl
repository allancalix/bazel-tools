def _prom_test_impl(ctx):
    args = ["test", "rules"]

    cmd = " ".join([
      ctx.executable.promtool.path,
      "test",
      "rules",
    ] + [f.path for f in ctx.files.srcs])

    ctx.actions.write(
      output = ctx.outputs.executable,
      content = cmd,
    )

    runfiles = ctx.files.srcs + ctx.files.rules + [
      ctx.executable.promtool,
    ]
    return [DefaultInfo(runfiles = ctx.runfiles(runfiles))]

prom_test = rule(
    implementation = _prom_test_impl,
    test = True,
    attrs = {
        "srcs": attr.label_list(allow_files = True),
        "rules": attr.label_list(allow_files = True),
        "promtool": attr.label(
            executable = True,
            allow_files = True,
            cfg = "exec",
            default = Label("@default//:promtool"),
        ),
    },
)
