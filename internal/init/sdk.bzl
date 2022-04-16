_PROM_ARCHIVES = {
    "linux_amd64": {
        "archives": [
            "https://github.com/prometheus/prometheus/releases/download/v2.34.0/prometheus-2.34.0.linux-amd64.tar.gz",
        ],
        "sha256": "9ec560940bf53361dd9d3a867d51ceb96f3854ae12f5e532b7d3f60c27f364d0",
        "strip_prefix": "prometheus-2.34.0.linux-amd64",
    },
    "darwin_x86": {
        "archives": [
            "https://github.com/prometheus/prometheus/releases/download/v2.34.0/prometheus-2.34.0.darwin-amd64.tar.gz",
        ],
        "sha256": "8b7af5708d91846fc99db2ae56b06e2ecf953319414f0be85bf882739dcf3dc7",
        "strip_prefix": "prometheus-2.34.0.darwin-amd64",
    },
    "darwin_arm64": {
        "archives": [
            "https://github.com/prometheus/prometheus/releases/download/v2.34.0/prometheus-2.34.0.darwin-arm64.tar.gz",
        ],
        "sha256": "be8a8d2528512d22ea804934090461ebd432bf0cbaf545dd36e41e5a8e96235e",
        "strip_prefix": "prometheus-2.34.0.darwin-arm64",
    },
}

_LEVANT_ARCHIVES = {
    "linux_amd64": {
        "archives": [
            "https://releases.hashicorp.com/levant/0.3.0/levant_0.3.0_linux_amd64.zip",
        ],
        "sha256": "082bd747cf49bc317035a4caab8742924eac67605a82b1b5f4640d896999ea98",
    },
    # TODO(allancalix): Fix to proper arm64 builds, but amd64 builds seem to work fine?
    "darwin_arm64": {
        "archives": [
            "https://releases.hashicorp.com/levant/0.3.0/levant_0.3.0_darwin_amd64.zip",
        ],
        "sha256": "cbe353c218135f7dfce301b7f667138520958e17925cbebbf01c70ebb152be45",
    },
    "darwin_x86": {
        "archives": [
            "https://releases.hashicorp.com/levant/0.3.0/levant_0.3.0_darwin_amd64.zip",
        ],
        "sha256": "cbe353c218135f7dfce301b7f667138520958e17925cbebbf01c70ebb152be45",
    },
}

_NOMAD_ARCHIVES = {
    "linux_amd64": {
        "archives": [
            "https://releases.hashicorp.com/nomad/1.2.6/nomad_1.2.6_linux_amd64.zip",
        ],
        "sha256": "a7bee57db3c3a595ecba964f7afee9c32ebb6799eb7a1682deb0a7cd8e7d08c0",
    },
    # TODO(allancalix): Fix to proper arm64 builds, but amd64 builds seem to work fine?
    "darwin_arm64": {
        "archives": [
            "https://releases.hashicorp.com/nomad/1.2.6/nomad_1.2.6_darwin_amd64.zip",
        ],
        "sha256": "34d09fbfa9829fbe8660fc721d82fd867f8aa462c277f1a6f1046c731c81af23",
    },
    "darwin_x86": {
        "archives": [
            "https://releases.hashicorp.com/nomad/1.2.6/nomad_1.2.6_darwin_amd64.zip",
        ],
        "sha256": "34d09fbfa9829fbe8660fc721d82fd867f8aa462c277f1a6f1046c731c81af23",
    },
}

_OPA_ARCHIVES = {
    "linux_amd64": {
        "archives": [
            "https://github.com/open-policy-agent/opa/releases/download/v0.39.0/opa_linux_amd64_static",
        ],
        "sha256": "19a24f51d954190c02aafeac5867c9add286c6ab12ea85b3d8d348c98d633319",
    },
    "darwin_arm64": {
        "archives": [
            "https://github.com/open-policy-agent/opa/releases/download/v0.39.0/opa_darwin_arm64_static",
        ],
        "sha256": "d756bbf051249fcbeb27805480da94eeffa81290906879258457ea701bbc0e55",
    },
    "darwin_x86": {
        "archives": [
            "https://github.com/open-policy-agent/opa/releases/download/v0.39.0/opa_darwin_amd64",
        ],
        "sha256": "c2a597cd19679bec805f642160bf3255450452834b94efac4981c127861cfada",
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

    ctx.download_and_extract(
        url = _NOMAD_ARCHIVES[ctx.attr.platform]["archives"],
        sha256 = _NOMAD_ARCHIVES[ctx.attr.platform]["sha256"],
    )

    ctx.download(
        url = _OPA_ARCHIVES[ctx.attr.platform]["archives"],
        output = "opa",
        executable = True,
        sha256 = _OPA_ARCHIVES[ctx.attr.platform]["sha256"],
    )

    if ctx.attr.os == "darwin":
        os_constraint = "@platforms//os:macos"
    elif ctx.attr.os == "linux":
        os_constraint = "@platforms//os:linux"
    else:
        fail("unsupported os type " + ctx.attr.os)

    if ctx.attr.arch == "x86":
        arch_constraint = "@platforms//cpu:x86_64"
    elif ctx.attr.arch == "arm64":
        arch_constraint = "@platforms//cpu:arm64"
    else:
        fail("unsupported architecture type " + ctx.attr.arch)

    constraint_fmt = ",\n        ".join(['"%s"' % c for c in [os_constraint, arch_constraint]])

    ctx.template(
        "BUILD",
        ctx.attr._build_tpl,
        substitutions = {
            "{platform}": ctx.attr.platform,
            "{constraints}": constraint_fmt,
        },
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
            values = ["x86", "arm64"],
            mandatory = True,
        ),
        "_build_tpl": attr.label(
            default = "//internal/init:BUILD.bzl.tpl",
        ),
    },
    doc = "Installs Prometheus standard tooling.",
)
