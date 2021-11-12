# Bazel Tools
A collection of rules and macros for working with a variety of popular open source
tools.

## Tools

    * [Prometheus](https://github.com/prometheus/prometheus)
        * Alerts and recorded expression unit tests

    * [Opa](https://github.com/open-policy-agent/opa)
        * Rule for testing Opa policies
        * Rule for compiling data and policy files into bundles

    * [Nomad](https://github.com/hashicorp/nomad)
        * Rule for rendering a job definition using [Levant](https://github.com/hashicorp/levant)
        * Rule for deploying to nomad `nomad run`

## Rules

* [Prometheus Rules](./internal/prometheus_rules)

## Caveats
These rules are meant to support my own day-to-day activities and are not meant
to be complete integrations. Additionally, toolchain support is currently set up
for x86_64 Linux and Darwin based systems.

These rules can work for other platforms, namely M1 Mac (ARM) and Windows, but
requires a custom toolchain setup. As of this writing, all the tools supported
by these rules do not publish prebuilt binaries for these platforms requiring
some additional work.
