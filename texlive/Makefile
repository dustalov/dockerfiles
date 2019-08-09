ifeq ($(shell uname -m),x86_64)
TARGET := latest
else
TARGET := latest-$(shell uname -m)
endif

build:
	docker build --rm -t dustalov/texlive-alpine:$(TARGET) .

build-local:
	docker build --rm -t texlive .

build-nocache:
	docker build --rm -t dustalov/texlive-alpine:$(TARGET) --no-cache --pull .

push:
	docker push dustalov/texlive-alpine:$(TARGET)
