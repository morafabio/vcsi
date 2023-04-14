#!/usr/bin/env bash
set -ue

export PATH="${PATH}:/app/.local/bin"
source /opt/profile.sh

exec "$@"
