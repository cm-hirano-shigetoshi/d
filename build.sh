#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR=$(perl -MCwd=realpath -le 'print realpath shift' "$0/..")
(cd "$SCRIPT_DIR/rust/d" && cargo build --release)

