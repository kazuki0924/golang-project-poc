#!/usr/bin/env bash
set -Eeuo pipefail
IFS=$'\n\t'

go test -gcflags=all=-l $(go list ./... | grep -v cmd | grep -v cmd/seeder) -coverprofile=coverage.out
