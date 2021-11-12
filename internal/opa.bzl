def _opa_test_impl(ctx):
    opa = ctx.toolchains["//:toolchain_type"].opa

    cmd = " ".join([
      opa.path,
      "test",
    ] + [f.path for f in ctx.files.srcs])

    ctx.actions.write(
      output = ctx.outputs.executable,
      content = cmd,
    )

    runfiles = ctx.files.srcs + [opa]
    return [DefaultInfo(runfiles = ctx.runfiles(runfiles))]

opa_test = rule(
    implementation = _opa_test_impl,
    test = True,
    attrs = {
        "srcs": attr.label_list(
          allow_files = True,
          mandatory = True,
        ),
    },
    toolchains = ["//:toolchain_type"],
)
