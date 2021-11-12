def _nomad_deploy_impl(ctx):
    toolchain = ctx.toolchains["//:toolchain_type"]

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
    attrs = {
        "job": attr.label(
            allow_single_file = True,
            mandatory = True,
        ),
    },
    executable = True,
    toolchains = ["//:toolchain_type"],
)

