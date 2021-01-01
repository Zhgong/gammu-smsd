#!/bin/bash
script_name=$0
script_full_path=$(dirname "$0")

$script_full_path/stop-prune.sh
$script_full_path/build.sh && $script_full_path/run-production.sh