"""Rules for testing Prometheus alerts and configurations."""

def _prom_test_impl(ctx):
    cmd = " ".join([
        ctx.toolchains["@rules_acx_tools//:toolchain_type"].promtool.path,
        "test",
        "rules",
    ] + [f.path for f in ctx.files.srcs])

    ctx.actions.write(
        output = ctx.outputs.executable,
        content = cmd,
    )

    runfiles = ctx.files.srcs + ctx.files.rules + [
        ctx.toolchains["@rules_acx_tools//:toolchain_type"].promtool,
    ]
    return [DefaultInfo(runfiles = ctx.runfiles(runfiles))]

prom_test = rule(
    implementation = _prom_test_impl,
    doc = """
Executes Prometheus unit tests for recorded expressions and alerting rules.

Example:
```
  prom_test(
    name = "alerting_rules_test",
    srcs = ["alerts_test.yaml"],
    rules = ["alerts.yaml"],
  )
```
""",
    test = True,
    attrs = {
        "srcs": attr.label_list(
            allow_files = True,
            doc = "Unit test input files.",
            mandatory = True,
        ),
        "rules": attr.label_list(
            allow_files = True,
            doc = "Prometheus rules containing alerts and recorded expressions to test.",
            mandatory = True,
        ),
    },
    toolchains = ["@rules_acx_tools//:toolchain_type"],
)
