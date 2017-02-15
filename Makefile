NAME := picymru/website
VERSION := 2017.2.0

.PHONY: build
build:
	docker build -t quay.io/${NAME}:${VERSION} .

.PHONY: push
push:
	docker push quay.io/${NAME}:${VERSION}

.PHONY: remove
remove:
	docker rmi quay.io/${NAME}:${VERSION}
