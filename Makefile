# Docker Image Builder
# Version 1.0
#
# default: help
#

export CURRENT_DIR = $(shell pwd)

all:
	@docker rm -f build-weedfs-fs &> /dev/null ||:
	@docker pull infinitely/go:latest
	@docker run -it --name build-weedfs-fs infinitely/go:latest go get -u github.com/chrislusf/seaweedfs/go/weed
	@docker cp build-weedfs-fs:/usr/local/go/bin/weed ${CURRENT_DIR}/weed
	@docker build --no-cache --tag infinitely/weedfs:latest . ||:
	@rm -rf ${CURRENT_DIR}/weed

