#!/usr/bin/env bash
set -euo pipefail

sed -i -E '/^ *order: [0-9]+$/d' $1
sed -i -E '/^ *deferrable: [a-z]+$/d' $1
sed -i -E '/^ *initiallyDeferred: [a-z]+$/d' $1
sed -i -E '/^ *deleteRule: [a-zA-Z]+$/d' $1
sed -i -E '/^ *updateRule: [a-zA-Z]+$/d' $1
sed -i -E '/^ *using: btree$/d' $1
sed -i -E 's/\bbigserial\b/int8/g' $1
sed -i -E 's/\bAUTO INCREMENT START WITH [0-9]+ INCREMENT BY [0-9]+\b/AUTO INCREMENT/g' $1
