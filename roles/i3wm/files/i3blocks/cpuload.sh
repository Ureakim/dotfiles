#!/usr/bin/env bash

LABEL="${LABEL:-}"
FG_COLOR=${FG_COLOR:-"#fcfcfc"}
BG_COLOR=${BG_COLOR:-"#191c24"}

load="$(cut -d ' ' -f1 /proc/loadavg)"
cpus="$(nproc)"

echo "${LABEL}$load"
echo "${LABEL}$load"
echo "${FG_COLOR}"
echo "${BG_COLOR}"
