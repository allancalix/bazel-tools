load("@rules_acx_tools//:def.bzl", "levant", "nomad_deploy")

levant(
    name = "job_def",
    srcs = ["deploy_basic.nomad"],
    vars_files = [
        "vars.yaml",
    ],
)

nomad_deploy(
  name = "deploy_job",
  job = ":job_def",
)
