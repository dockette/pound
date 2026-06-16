DOCKER_IMAGE=dockette/pound
DOCKER_TAG?=latest

.PHONY: build
build:
	docker build -t ${DOCKER_IMAGE}:${DOCKER_TAG} .

.PHONY: test
test:
	docker run --rm ${DOCKER_IMAGE}:${DOCKER_TAG} pound -V
	docker run --rm ${DOCKER_IMAGE}:${DOCKER_TAG} pound -c -f /etc/pound/config.cfg

.PHONY: run
run:
	docker run --rm -it -p 80:80 ${DOCKER_IMAGE}:${DOCKER_TAG}
