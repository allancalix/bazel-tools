"""Rules for working with Nomad job definition files."""

def _levant_impl(ctx):
    toolchain = ctx.toolchains["@rules_acx_tools//:toolchain_type"]
    out = ctx.actions.declare_file(ctx.label.name + ".hcl")

    args = ["render", "-out", out.path]
    var_args = [f.path for f in ctx.files.vars_files]

    for arg in var_args:
        args += ["-var-file", arg]

    args = args + [f.path for f in ctx.files.srcs]

    ctx.actions.run(
        inputs = ctx.files.srcs + ctx.files.vars_files + ctx.files.data,
        outputs = [out],
        arguments = args,
        executable = toolchain.levant,
    )

    return [DefaultInfo(files = depset([out]))]

_levant_srcs_doc = """
One or more variable files to use to interpolate during render. Note that missing
variable values will be rendered as empty and not return an error.
"""

levant = rule(
    implementation = _levant_impl,
    doc = """
Renders a Levant template into a Nomad job defitinion file.

Example:
```
load("@rules_acx_tools//:def.bzl", "levant")

levant(
    name = "job_def",
    srcs = ["deploy_basic.nomad"],
    vars_files = [
        "vars.yaml",
    ],
)

```
""",
    attrs = {
        "srcs": attr.label_list(
            allow_files = True,
            doc = "One or more Levant template files. Can also be plain HCL2 files.",
        ),
        "vars_files": attr.label_list(
            allow_files = True,
            doc = """
One or more variable files to use to interpolate during render. Note that missing
variable values will be rendered as empty and not return an error.
""",
        ),
        "data": attr.label_list(
            allow_files = True,
            doc = """
Data files to include in the render. Files embedded using `fileContents` should
be included as data.
""",
        ),
    },
    toolchains = ["@rules_acx_tools//:toolchain_type"],
)

def _nomad_deploy_impl(ctx):
    toolchain = ctx.toolchains["@rules_acx_tools//:toolchain_type"]

    script = ctx.actions.declare_file(ctx.label.name + ".deploy")
    command = " ".join([toolchain.nomad.path, "run", ctx.file.job.short_path])

    ctx.actions.write(
        output = script,
        content = command,
        is_executable = True,
    )

    runfiles = ctx.runfiles(files = [ctx.file.job, toolchain.nomad])

    return [
        DefaultInfo(executable = script, runfiles = runfiles),
    ]

nomad_deploy = rule(
    implementation = _nomad_deploy_impl,
    doc = """
An executable rule for deploying job definitions (i.e. `nomad run`).

Example:
```
load("@rules_acx_tools//:def.bzl", "nomad_deploy")

nomad_deploy(
  name = "deploy_job",
  job = ":job_def",
)
```
""",
    attrs = {
        "job": attr.label(
            allow_single_file = True,
            mandatory = True,
            doc = "A valid job definition file to deploy.",
        ),
    },
    executable = True,
    toolchains = ["@rules_acx_tools//:toolchain_type"],
)
