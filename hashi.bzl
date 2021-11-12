"""Defines rules for rendering levant templates and deploying to Nomad."""

def _levant_impl(ctx):
    toolchain = ctx.toolchains["//:toolchain_type"]
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

levant = rule(
    implementation = _levant_impl,
    attrs = {
        "srcs": attr.label_list(allow_files = True),
        "vars_files": attr.label_list(allow_files = True),
        "data": attr.label_list(allow_files = True),
    },
    toolchains = ["//:toolchain_type"],
)

def _nomad_impl(ctx):
    script = ctx.actions.declare_file(ctx.label.name + ".deploy")
    command = "nomad run " + ctx.file.job.short_path

    ctx.actions.write(
        output = script,
        content = command,
        is_executable = True,
    )

    runfiles = ctx.runfiles(files = [ctx.file.job])

    return [
        DefaultInfo(executable = script, runfiles = runfiles),
    ]

nomad = rule(
    implementation = _nomad_impl,
    attrs = {
        "job": attr.label(
            allow_single_file = True,
            mandatory = True,
        ),
    },
    executable = True,
)
