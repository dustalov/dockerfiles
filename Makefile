all:
	docker build --rm -t dustalov/jekyll-alpine .

push:
	docker push dustalov/jekyll-alpine
