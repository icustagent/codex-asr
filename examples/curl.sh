#!/usr/bin/env bash
set -euo pipefail

BASE_URL="${CODEX_ASR_BASE_URL:-http://127.0.0.1:8788/v1}"
API_KEY="${CODEX_ASR_SERVER_KEY:-local_dev_key}"
AUDIO="${1:-audio.wav}"

curl -sS "${BASE_URL%/}/audio/transcriptions" \
  -H "Authorization: Bearer ${API_KEY}" \
  -F model=whisper-1 \
  -F response_format=json \
  -F "file=@${AUDIO}"
