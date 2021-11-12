"""
TODO:
  * Add nomad repo rule
  * Add opa tool chain
  * Add opa bundle / test rules
"""
_PROMTOOL_CLI = "promtool"

_PROM_ARCHIVES = {
    "linux_amd64": {
      "archives": [
        "https://github.com/prometheus/prometheus/releases/download/v2.31.1/prometheus-2.31.1.linux-amd64.tar.gz",
      ],
      "sha256": "7852dc11cfaa039577c1804fe6f082a07c5eb06be50babcffe29214aedf318b3",
      "strip_prefix": "prometheus-2.31.1.linux-amd64",
    },
    "darwin_x86": {
      "archives": [
        "https://github.com/prometheus/prometheus/releases/download/v2.31.1/prometheus-2.31.1.darwin-amd64.tar.gz",
      ],
      "sha256": "4ef3cbd521b7b77105a6ec617f43b86e4c8461746d27ac6a2548bb618ca0250c",
      "strip_prefix": "prometheus-2.31.1.darwin-amd64",
    },
}

_LEVANT_ARCHIVES = {
    "linux_amd64": {
      "archives": [
        "https://releases.hashicorp.com/levant/0.3.0/levant_0.3.0_linux_amd64.zip",
      ],
      "sha256": "082bd747cf49bc317035a4caab8742924eac67605a82b1b5f4640d896999ea98",
    },
    "darwin_x86": {
      "archives": [
        "https://releases.hashicorp.com/levant/0.3.0/levant_0.3.0_darwin_amd64.zip",
      ],
      "sha256": "cbe353c218135f7dfce301b7f667138520958e17925cbebbf01c70ebb152be45",
    },
}

def _prom_sdk_impl(ctx):
  ctx.report_progress("Downloading and extracting Promtool executable")

  ctx.download_and_extract(
    url = _PROM_ARCHIVES[ctx.attr.platform]["archives"],
    stripPrefix = _PROM_ARCHIVES[ctx.attr.platform]["strip_prefix"],
    sha256 = _PROM_ARCHIVES[ctx.attr.platform]["sha256"],
  )

  ctx.download_and_extract(
    url = _LEVANT_ARCHIVES[ctx.attr.platform]["archives"],
    sha256 = _LEVANT_ARCHIVES[ctx.attr.platform]["sha256"],
  )

  if ctx.attr.os == "darwin":
      os_constraint = "@platforms//os:macos"
  elif ctx.attr.os == "linux":
      os_constraint = "@platforms//os:linux"
  else:
      fail("unsupported os type " + ctx.attr.os)

  if ctx.attr.arch == "x86":
      arch_constraint = "@platforms//cpu:x86_64"
  else:
      fail("unsupported architecture type " + ctx.attr.os)

  constraint_fmt = ",\n        ".join(['"%s"' % c for c in [os_constraint, arch_constraint]])

  ctx.template(
    "BUILD",
    ctx.attr._build_tpl,
    substitutions = {
      "{platform}": ctx.attr.platform,
      "{constraints}": constraint_fmt,
    }
  )

prom_sdk = repository_rule(
  implementation = _prom_sdk_impl,
  attrs = {
    "platform": attr.string(mandatory = True, doc = ""),
    "os": attr.string(
      values = ["darwin", "linux"],
      mandatory = True,
    ),
    "arch": attr.string(
      values = ["x86"],
      mandatory = True,
    ),
    "_build_tpl": attr.label(
      default = "//internal/init:BUILD.bzl.tpl",
    ),
  },
  doc = "Installs Prometheus standard tooling.",
)
