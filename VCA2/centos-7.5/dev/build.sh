#!/bin/bash -e

IMAGE="vca2-centos75-dev"
VERSION="19.11"
DIR=$(dirname $(readlink -f "$0"))

. "${DIR}/../../../script/build.sh"
