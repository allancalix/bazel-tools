load("//:def.bzl", "opa_test", "opa_bundle")

opa_test(
  name = "example_test",
  srcs = glob(["*.rego"]),
)

opa_bundle(
  name = "example_bundle",
  srcs = glob(["*.rego"]),
)
