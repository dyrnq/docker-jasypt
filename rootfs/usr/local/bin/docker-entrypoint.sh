#!/bin/bash
set -eo pipefail
shopt -s nullglob


_main() {
  exec "$@"
}


_main "$@"
