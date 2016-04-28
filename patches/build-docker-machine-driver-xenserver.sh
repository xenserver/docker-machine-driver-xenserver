#!/bin/bash

export GITHUB_USER=${GITHUB_USER:-xenserver}
export GITHUB_REPO=${GITHUB_REPO:-docker-machine-driver-xenserver}
export GITHUB_COMMIT_ID=${TRAVIS_COMMIT:-${COMMIT_ID:-master}}
export WORKING_DIR=/tmp/tmp.$(date "+%Y%m%d%H%M%S").${RANDOM:-$$}.${GITHUB_REPO}
export GOROOT_BOOTSTRAP=${WORKING_DIR}/go1.6
export GOROOT=${WORKING_DIR}/go
export GOPATH=${WORKING_DIR}/gopath
export PATH=$GOROOT/bin:$GOPATH/bin:$PATH

mkdir -p ${WORKING_DIR}

function build_go() {
	pushd ${WORKING_DIR}

	curl -k https://storage.googleapis.com/golang/go1.6.linux-amd64.tar.gz | tar xz
	mv go go1.6

	git clone --depth 50 --branch release-branch.go1.6 https://github.com/golang/go
	patch -d go -p1 < <(curl -k -L https://github.com/${GITHUB_USER}/${GITHUB_REPO}/raw/master/patches/TLS_RSA_WITH_AES_128_CBC_SHA256.patch)
	(cd go/src && bash ./make.bash)

	go env
	go version

	popd
}

function build_repo() {
	pushd ${WORKING_DIR}

	go get -v github.com/${GITHUB_USER}/${GITHUB_REPO}

	popd
}

function release_repo() {
	if [ "$TRAVIS_PULL_REQUEST" == "true" ]; then
		return
	fi

	pushd ${WORKING_DIR}

	if [ -d "${WORKSPACE}" ]; then
		local FILENAME=docker-machine-driver-xenserver_$(go env GOOS)-$(go env GOARCH)
		cp -rf $GOPATH/bin/docker-machine-driver-xenserver ${WORKSPACE}/${FILENAME}
	fi

	popd
}

function clean() {
	rm -rf $HOME/tmp.*.${GITHUB_REPO}
}

build_go
build_repo
release_repo
clean
