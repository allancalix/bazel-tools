def _opa_test_impl(ctx):
    opa = ctx.toolchains["//:toolchain_type"].opa

    cmd = " ".join([
      opa.path,
      "test",
    ] + [f.path for f in ctx.files.srcs] + [f.path for f in ctx.files.data])

    ctx.actions.write(
      output = ctx.outputs.executable,
      content = cmd,
    )

    runfiles = ctx.files.srcs + ctx.files.data + [opa]
    return [DefaultInfo(runfiles = ctx.runfiles(runfiles))]

opa_test = rule(
    implementation = _opa_test_impl,
    test = True,
    attrs = {
        "srcs": attr.label_list(
          allow_files = True,
          mandatory = True,
        ),
        "data": attr.label_list(
          allow_files = True,
          default = [],
        ),
    },
    toolchains = ["//:toolchain_type"],
)

def _opa_bundle_impl(ctx):
    opa = ctx.toolchains["//:toolchain_type"].opa
    bundle = ctx.actions.declare_file(ctx.label.name + ".bundle.tar.gz")

    args = [
      "build",
      "-t", ctx.attr.type,
      "-o", bundle.path,
    ] + [f.path for f in ctx.files.srcs] + [f.path for f in ctx.files.data]

    ctx.actions.run(
        inputs = ctx.files.srcs + ctx.files.data,
        outputs = [bundle],
        arguments = args,
        executable = opa,
    )

    return [DefaultInfo(files = depset([bundle]))]

opa_bundle = rule(
    implementation = _opa_bundle_impl,
    attrs = {
        "srcs": attr.label_list(
          allow_files = True,
          mandatory = True,
        ),
        "data": attr.label_list(
          allow_files = True,
          default = [],
        ),
        "type": attr.string(
          values = ["rego", "wasm"],
          default = "rego",
          doc = "Set the output bundle target type (default rego).",
        ),
    },
    toolchains = ["//:toolchain_type"],
)
