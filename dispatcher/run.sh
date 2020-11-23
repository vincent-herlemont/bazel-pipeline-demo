#!/bin/sh
declare -r actions=$ACTIONS

declare -p actions

bazel run //dispatcher $actions