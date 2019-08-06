ifeq ($(shell uname -m),x86_64)
TARGET := latest
else
TARGET := latest-$(shell uname -m)
endif

build:
	docker build --rm -t dustalov/jekyll-alpine:$(TARGET) .

build-nocache:
	docker build --rm -t dustalov/jekyll-alpine:$(TARGET) --no-cache .

push:
	docker push dustalov/jekyll-alpine:$(TARGET)
