#!/usr/bin/env bash

set -ueo pipefail
shopt -s extglob

OUT_DIR="bazel-bin/internal/"

bazel build $(bazel query 'kind(stardoc, //...)')
rsync -vr --exclude="*.raw" --chmod=0666 "$OUT_DIR" internal/
