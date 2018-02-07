#!/usr/bin/env bash

set -e

dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && cd .. && pwd )"
web_dir=$dir/src/github.com/aemengo/bosh-deployment-dashboard/web

pushd $web_dir > /dev/null
    rm -rf build
    elm-app build
popd > /dev/null

rm -rf $dir/blobs/web
mkdir -p $dir/blobs/web
tar czf $dir/blobs/web/web.tgz -C $web_dir build
bosh add-blob $dir/blobs/web/web.tgz web/web.tgz