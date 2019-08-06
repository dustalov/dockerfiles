all:
	docker build --rm -t dustalov/github-pages-alpine .

push:
	docker push dustalov/github-pages-alpine
