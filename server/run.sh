#!/bin/sh
declare -r actions=$ACTIONS

declare -p actions

bazel run //server $actions