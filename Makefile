ifeq ($(shell uname -m),x86_64)
TARGET := latest
else
TARGET := latest-$(shell uname -m)
endif

all:
	docker build --rm -t dustalov/jekyll-alpine:$(TARGET) .

push:
	docker push dustalov/jekyll-alpine:$(TARGET)
