DOCKER_BASE ?= docker://
BINS := bin/skopeo

.PHONY: build
build:
	stacker build --substitute=DOCKER_BASE=$(DOCKER_BASE)

bin/%: build
	stacker grab build:export/$* && mv $* bin/$*

.PHONY: bins
bins: $(BINS)
