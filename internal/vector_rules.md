<!-- Generated with Stardoc: http://skydoc.bazel.build -->



<a id="#vector_test"></a>

## vector_test

<pre>
vector_test(<a href="#vector_test-name">name</a>, <a href="#vector_test-srcs">srcs</a>)
</pre>


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


**ATTRIBUTES**


| Name  | Description | Type | Mandatory | Default |
| :------------- | :------------- | :------------- | :------------- | :------------- |
| <a id="vector_test-name"></a>name |  A unique name for this target.   | <a href="https://bazel.build/docs/build-ref.html#name">Name</a> | required |  |
| <a id="vector_test-srcs"></a>srcs |  Configuration files to include in tests.   | <a href="https://bazel.build/docs/build-ref.html#labels">List of labels</a> | required |  |


<a id="#vector_validate_test"></a>

## vector_validate_test

<pre>
vector_validate_test(<a href="#vector_validate_test-name">name</a>, <a href="#vector_validate_test-srcs">srcs</a>)
</pre>


Runs Vector validation on one or more configurations.

Notably, validation serves a different purpose than unit tests. Validation can
be used to gain confidence that the set of configurations can start without any
obvious errors. For correctness checks on log parsing logic try unit tests instead.

This rule omits any _environment checks_ to keep things hermetic and avoid
configuration requirements.
```
load("@rules_acx_tools//:def.bzl", "vector_validate_test")

vector_validate_test(
  name = "example_test",
  srcs = ["config.toml"],
)
```


**ATTRIBUTES**


| Name  | Description | Type | Mandatory | Default |
| :------------- | :------------- | :------------- | :------------- | :------------- |
| <a id="vector_validate_test-name"></a>name |  A unique name for this target.   | <a href="https://bazel.build/docs/build-ref.html#name">Name</a> | required |  |
| <a id="vector_validate_test-srcs"></a>srcs |  Configuration files to include in tests.   | <a href="https://bazel.build/docs/build-ref.html#labels">List of labels</a> | required |  |


