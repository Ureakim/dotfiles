#!/usr/bin/env bash

LABEL="${LABEL:-}"
FG_COLOR=${FG_COLOR:-"#fcfcfc"}
BG_COLOR=${BG_COLOR:-"#191c24"}

MEMORY=$(free -h | awk '/Mem:/ { printf("%5s/%s \n", $3, $2) }')

echo "${LABEL}${MEMORY}"
echo "${LABEL}${MEMORY}"
echo "${FG_COLOR}"
echo "${BG_COLOR}"
