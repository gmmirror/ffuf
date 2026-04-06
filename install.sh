#!/usr/bin/env bash

if [[ ! -d "${PREFIX}/opt" ]]; then
    command mkdir -p "${PREFIX}/opt"
fi

if [[ -d "${PREFIX}/opt/ffuf" ]]; then
    command rm -rf "${PREFIX}/opt/ffuf"
fi

if [[ -x "${PREFIX}/bin/ffuf" ]]; then
    command rm -f "${PREFIX}/bin/ffuf"
fi

command git clone --depth 1 \
    'https://github.com/ffuf/ffuf' \
    "${PREFIX}/opt/ffuf"

cd "${PREFIX}/opt/ffuf"
command go mod tidy
command go build -v -o "${PREFIX}/bin/ffuf"
cd