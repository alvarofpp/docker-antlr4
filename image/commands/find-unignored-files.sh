#!/bin/bash

DIR=${1:-"."}
FILTER=${2:-".*"}

find "${DIR}" -path ./.git -prune -o -type f -regex "${FILTER}" -print | git check-ignore --verbose --non-matching --stdin | grep "::" | awk '{print $2}'
