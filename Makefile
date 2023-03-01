DOCKER_BASE ?= docker://
BINS := skopeo

.PHONY: build
build:
	stacker build --substitute=DOCKER_BASE=$(DOCKER_BASE)

.PHONY: bins
bins: build
	@mkdir -p bin
	for f in $(BINS); do \
		stacker grab "build:export/$$f" && \
	    mv $$f bin/$$f; done
