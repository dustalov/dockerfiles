TAG := $(shell uname -sm | awk -F' ' '{ print tolower($$1) "-" $$2 }')

%: Dockerfile.%
	docker build --rm -t dustalov/$@:$(TAG) -f $< .

%-nocache: Dockerfile.%
	docker build --rm --no-cache --pull -t dustalov/$(patsubst %-nocache,%,$@):$(TAG) -f $< .
