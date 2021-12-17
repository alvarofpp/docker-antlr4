# Variables
DOCKER_IMAGE=alvarofpp/antlr4
DOCKER_IMAGE_LINTER=alvarofpp/docker-image-linter
ROOT=$(shell pwd)
DIR=image/
LINT_COMMIT_TARGET_BRANCH=origin/main
ANTLR_VERSION=4.9.3

# Commands
.PHONY: install-hooks
install-hooks:
	git config core.hooksPath .githooks

.PHONY: build
build: install-hooks
	@docker build --build-arg ANTLR_VERSION="${ANTLR_VERSION}" ${DIR} -t ${DOCKER_IMAGE}

.PHONY: build-no-cache
build-no-cache: install-hooks
	@docker build --build-arg ANTLR_VERSION="${ANTLR_VERSION}" ${DIR} -t ${DOCKER_IMAGE} --no-cache

.PHONY: build-all
build-all: install-hooks
	@./build_all.sh

.PHONY: push
push:
	@docker push ${DOCKER_IMAGE}

.PHONY: push-all
push-all:
	@./push_all.sh

.PHONY: lint
lint:
	@docker pull ${DOCKER_IMAGE_LINTER}
	@docker run --rm -v ${ROOT}:/app ${DOCKER_IMAGE_LINTER} " \
		lint-commit ${LINT_COMMIT_TARGET_BRANCH} \
		&& lint-markdown \
		&& lint-dockerfile \
		&& lint-shell-script \
		&& lint-yaml"
