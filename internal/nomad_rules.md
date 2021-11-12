<!-- Generated with Stardoc: http://skydoc.bazel.build -->

Rules for working with Nomad job definition files.

<a id="#levant"></a>

## levant

<pre>
levant(<a href="#levant-name">name</a>, <a href="#levant-data">data</a>, <a href="#levant-srcs">srcs</a>, <a href="#levant-vars_files">vars_files</a>)
</pre>


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


**ATTRIBUTES**


| Name  | Description | Type | Mandatory | Default |
| :------------- | :------------- | :------------- | :------------- | :------------- |
| <a id="levant-name"></a>name |  A unique name for this target.   | <a href="https://bazel.build/docs/build-ref.html#name">Name</a> | required |  |
| <a id="levant-data"></a>data |  Data files to include in the render. Files embedded using <code>fileContents</code> should be included as data.   | <a href="https://bazel.build/docs/build-ref.html#labels">List of labels</a> | optional | [] |
| <a id="levant-srcs"></a>srcs |  One or more Levant template files. Can also be plain HCL2 files.   | <a href="https://bazel.build/docs/build-ref.html#labels">List of labels</a> | optional | [] |
| <a id="levant-vars_files"></a>vars_files |  One or more variable files to use to interpolate during render. Note that missing variable values will be rendered as empty and not return an error.   | <a href="https://bazel.build/docs/build-ref.html#labels">List of labels</a> | optional | [] |


<a id="#nomad_deploy"></a>

## nomad_deploy

<pre>
nomad_deploy(<a href="#nomad_deploy-name">name</a>, <a href="#nomad_deploy-job">job</a>)
</pre>


An executable rule for deploying job definitions (i.e. `nomad run`).

Example:
```
load("@rules_acx_tools//:def.bzl", "nomad_deploy")

nomad_deploy(
  name = "deploy_job",
  job = ":job_def",
)
```


**ATTRIBUTES**


| Name  | Description | Type | Mandatory | Default |
| :------------- | :------------- | :------------- | :------------- | :------------- |
| <a id="nomad_deploy-name"></a>name |  A unique name for this target.   | <a href="https://bazel.build/docs/build-ref.html#name">Name</a> | required |  |
| <a id="nomad_deploy-job"></a>job |  A valid job definition file to deploy.   | <a href="https://bazel.build/docs/build-ref.html#labels">Label</a> | required |  |


