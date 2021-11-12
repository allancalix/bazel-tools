<!-- Generated with Stardoc: http://skydoc.bazel.build -->

Rules for testing Prometheus alerts and configurations.

<a id="#prom_test"></a>

## prom_test

<pre>
prom_test(<a href="#prom_test-name">name</a>, <a href="#prom_test-rules">rules</a>, <a href="#prom_test-srcs">srcs</a>)
</pre>


Executes Prometheus unit tests for recorded expressions and alerting rules.

Example:
```
  prom_test(
    name = "alerting_rules_test",
    srcs = ["alerts_test.yaml"],
    rules = ["alerts.yaml"],
  )
```


**ATTRIBUTES**


| Name  | Description | Type | Mandatory | Default |
| :------------- | :------------- | :------------- | :------------- | :------------- |
| <a id="prom_test-name"></a>name |  A unique name for this target.   | <a href="https://bazel.build/docs/build-ref.html#name">Name</a> | required |  |
| <a id="prom_test-rules"></a>rules |  Prometheus rules containing alerts and recorded expressions to test.   | <a href="https://bazel.build/docs/build-ref.html#labels">List of labels</a> | required |  |
| <a id="prom_test-srcs"></a>srcs |  Unit test input files.   | <a href="https://bazel.build/docs/build-ref.html#labels">List of labels</a> | required |  |


