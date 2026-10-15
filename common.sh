#!/usr/bin/env bash

CF_SERVICE_INSTANCE="${CF_SERVICE_INSTANCE:?"No service instance specified"}"

SK_NAME="${SK_PREFIX:-sk}-$(date +%Y%m%d%H%M%S)"
SK_PASSWORD="${SK_PASSWORD:-s3kr1t}"
SK_MAX_AGE="${SK_MAX_AGE:-30}" # mins

KEYS_DIR="$(dirname "$0")/keys"
NOW=$(date +%s)
MAX_AGE_SECS=$(( SK_MAX_AGE * 60 ))

mkdir -p "$KEYS_DIR"

if [[ ! -d "$KEYS_DIR" ]]; then
  echo "Keys directory not found: $KEYS_DIR"
  exit 1
fi

echo "Service instance : $CF_SERVICE_INSTANCE"
