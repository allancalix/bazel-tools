def _opa_test_impl(ctx):
    opa = ctx.toolchains["@rules_acx_tools//:toolchain_type"].opa

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
    doc = """
Runs Opa unit tests against a set of policies.

Example:
```
load("//:def.bzl", "opa_test")

opa_test(
  name = "example_test",
  srcs = glob(["*.rego"]),
  data = ["data.json"],
)
```
""",
    test = True,
    attrs = {
        "srcs": attr.label_list(
            allow_files = True,
            mandatory = True,
            doc = "Test and policy files to include in the test.",
        ),
        "data": attr.label_list(
            allow_files = True,
            default = [],
            doc = "Static data files to include in the test, could be mock data required by policies.",
        ),
    },
    toolchains = ["@rules_acx_tools//:toolchain_type"],
)

def _opa_bundle_impl(ctx):
    opa = ctx.toolchains["@rules_acx_tools//:toolchain_type"].opa
    bundle = ctx.actions.declare_file(ctx.label.name + ".bundle.tar.gz")

    args = [
        "build",
        "-t",
        ctx.attr.type,
        "-o",
        bundle.path,
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
    doc = """
Compiles a set of data and policies into an Opa bundle.

Bundles are created at zipped tarballs (.tar.gz) and can be loaded and executed
by Opa. Note that there are two types of bundles, `wasm` and `rego` and the bundle
defaults to `rego`.

Example:
```
load("//:def.bzl", "opa_bundle")

opa_bundle(
  name = "example_bundle",
  srcs = glob(["*.rego"]),
  data = ["data.json"],
)
```
""",
    attrs = {
        "srcs": attr.label_list(
            allow_files = True,
            mandatory = True,
            doc = "One or more Opa policy files to include in the bundle.",
        ),
        "data": attr.label_list(
            allow_files = True,
            default = [],
            doc = "One or more data files (Opa looks for a data.json file) to include.",
        ),
        "type": attr.string(
            values = ["rego", "wasm"],
            default = "rego",
            doc = "Set the output bundle target type (default rego).",
        ),
    },
    toolchains = ["@rules_acx_tools//:toolchain_type"],
)
