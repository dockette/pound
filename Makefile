DOCKER_IMAGE=dockette/pound
DOCKER_TAG?=latest
DOCKER_PLATFORMS?=linux/amd64,linux/arm64

.PHONY: build
build:
	docker buildx build --platform ${DOCKER_PLATFORMS} -t ${DOCKER_IMAGE}:${DOCKER_TAG} .

.PHONY: test
test:
	docker run --rm ${DOCKER_IMAGE}:${DOCKER_TAG} pound -V
	docker run --rm ${DOCKER_IMAGE}:${DOCKER_TAG} pound -c -f /etc/pound/config.cfg

.PHONY: run
run:
	docker run --rm -it -p 80:80 ${DOCKER_IMAGE}:${DOCKER_TAG}
