DOCKER := $(if $(shell which podman),podman,docker)

TAG := $(shell uname -sm | awk -F' ' '{ print tolower($$1) "-" $$2 }')

%: Dockerfile.%
	$(DOCKER) build --rm --pull -t 'dustalov/$*:$(TAG)' -f '$<' .

%-nocache: Dockerfile.%
	$(DOCKER) build --rm --pull --no-cache --pull -t 'dustalov/$*:$(TAG)' -f '$<' .
