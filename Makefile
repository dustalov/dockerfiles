%: Dockerfile.%
	docker build --rm -t dustalov/$@ -f $< .

%-nocache: Dockerfile.%
	docker build --rm --no-cache --pull -t dustalov/$(subst %-nocache,%,$@) -f $< .
