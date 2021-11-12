<!-- Generated with Stardoc: http://skydoc.bazel.build -->



<a id="#opa_bundle"></a>

## opa_bundle

<pre>
opa_bundle(<a href="#opa_bundle-name">name</a>, <a href="#opa_bundle-data">data</a>, <a href="#opa_bundle-srcs">srcs</a>, <a href="#opa_bundle-type">type</a>)
</pre>


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


**ATTRIBUTES**


| Name  | Description | Type | Mandatory | Default |
| :------------- | :------------- | :------------- | :------------- | :------------- |
| <a id="opa_bundle-name"></a>name |  A unique name for this target.   | <a href="https://bazel.build/docs/build-ref.html#name">Name</a> | required |  |
| <a id="opa_bundle-data"></a>data |  One or more data files (Opa looks for a data.json file) to include.   | <a href="https://bazel.build/docs/build-ref.html#labels">List of labels</a> | optional | [] |
| <a id="opa_bundle-srcs"></a>srcs |  One or more Opa policy files to include in the bundle.   | <a href="https://bazel.build/docs/build-ref.html#labels">List of labels</a> | required |  |
| <a id="opa_bundle-type"></a>type |  Set the output bundle target type (default rego).   | String | optional | "rego" |


<a id="#opa_test"></a>

## opa_test

<pre>
opa_test(<a href="#opa_test-name">name</a>, <a href="#opa_test-data">data</a>, <a href="#opa_test-srcs">srcs</a>)
</pre>


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


**ATTRIBUTES**


| Name  | Description | Type | Mandatory | Default |
| :------------- | :------------- | :------------- | :------------- | :------------- |
| <a id="opa_test-name"></a>name |  A unique name for this target.   | <a href="https://bazel.build/docs/build-ref.html#name">Name</a> | required |  |
| <a id="opa_test-data"></a>data |  Static data files to include in the test, could be mock data required by policies.   | <a href="https://bazel.build/docs/build-ref.html#labels">List of labels</a> | optional | [] |
| <a id="opa_test-srcs"></a>srcs |  Test and policy files to include in the test.   | <a href="https://bazel.build/docs/build-ref.html#labels">List of labels</a> | required |  |


