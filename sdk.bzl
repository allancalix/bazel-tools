_PROMTOOL_CLI = "promtool"

def _prom_sdk_impl(ctx):
  ctx.report_progress("Downloading and extracting Promtool executable")
  ctx.download_and_extract(
    url = [
      "https://github.com/prometheus/prometheus/releases/download/v2.31.1/prometheus-2.31.1.linux-amd64.tar.gz",
    ],
    stripPrefix = "prometheus-2.31.1.linux-amd64",
  )

  ctx.file("BUILD", 'exports_files(["promtool"])')

_prom_sdk = repository_rule(
  implementation = _prom_sdk_impl,
)

def prom_sdk(name="default"):
  _prom_sdk(name=name)

def _levant_sdk_impl(ctx):
  ctx.report_progress("Downloading and extracting Levant executable")
  pass

_levant_sdk = repository_rule(
  implementation = _levant_sdk_impl,
)

def levant_sdk(name="levant"):
  _levant_sdk(name=name)