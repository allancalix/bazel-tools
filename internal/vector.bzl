def _vector_test_impl(ctx):
    vector = ctx.toolchains["@rules_acx_tools//:toolchain_type"].vector

    cmd = " ".join([
        vector.path,
        "test"
    ] + [f.path for f in ctx.files.srcs])

    ctx.actions.write(
        output = ctx.outputs.executable,
        content = cmd,
    )

    runfiles = ctx.files.srcs + [vector]
    return [DefaultInfo(runfiles = ctx.runfiles(runfiles))]

vector_test = rule(
    implementation = _vector_test_impl,
    doc = """
Runs Vector unit tests for configurations.

For more information, see the [official docs](https://vector.dev/docs/reference/configuration/unit-tests/).

Example:
```
load("@rules_acx_tools//:def.bzl", "vector_test")

vector_test(
  name = "example_test",
  srcs = ["config.toml"],
)
```
""",
    test = True,
    attrs = {
        "srcs": attr.label_list(
            allow_files = True,
            mandatory = True,
            doc = "Configuration files to include in tests.",
        ),
    },
    toolchains = ["@rules_acx_tools//:toolchain_type"],
)
