#!/usr/bin/env bash

cd "$(dirname "$0")" || exit

VERSION="$( < ../VERSION )"
export VERSION

skaffold dev --tail
