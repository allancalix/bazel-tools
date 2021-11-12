<!-- Generated with Stardoc: http://skydoc.bazel.build -->



<a id="#opa_bundle"></a>

## opa_bundle

<pre>
opa_bundle(<a href="#opa_bundle-name">name</a>, <a href="#opa_bundle-data">data</a>, <a href="#opa_bundle-srcs">srcs</a>, <a href="#opa_bundle-type">type</a>)
</pre>



**ATTRIBUTES**


| Name  | Description | Type | Mandatory | Default |
| :------------- | :------------- | :------------- | :------------- | :------------- |
| <a id="opa_bundle-name"></a>name |  A unique name for this target.   | <a href="https://bazel.build/docs/build-ref.html#name">Name</a> | required |  |
| <a id="opa_bundle-data"></a>data |  -   | <a href="https://bazel.build/docs/build-ref.html#labels">List of labels</a> | optional | [] |
| <a id="opa_bundle-srcs"></a>srcs |  -   | <a href="https://bazel.build/docs/build-ref.html#labels">List of labels</a> | required |  |
| <a id="opa_bundle-type"></a>type |  Set the output bundle target type (default rego).   | String | optional | "rego" |


<a id="#opa_test"></a>

## opa_test

<pre>
opa_test(<a href="#opa_test-name">name</a>, <a href="#opa_test-data">data</a>, <a href="#opa_test-srcs">srcs</a>)
</pre>



**ATTRIBUTES**


| Name  | Description | Type | Mandatory | Default |
| :------------- | :------------- | :------------- | :------------- | :------------- |
| <a id="opa_test-name"></a>name |  A unique name for this target.   | <a href="https://bazel.build/docs/build-ref.html#name">Name</a> | required |  |
| <a id="opa_test-data"></a>data |  -   | <a href="https://bazel.build/docs/build-ref.html#labels">List of labels</a> | optional | [] |
| <a id="opa_test-srcs"></a>srcs |  -   | <a href="https://bazel.build/docs/build-ref.html#labels">List of labels</a> | required |  |


