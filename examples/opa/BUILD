load("//:def.bzl", "opa_bundle", "opa_test")

opa_test(
    name = "example_test",
    srcs = glob(["*.rego"]),
    data = ["data.json"],
)

opa_bundle(
    name = "example_bundle",
    srcs = glob(["*.rego"]),
    data = ["data.json"],
)
