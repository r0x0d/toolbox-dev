default: help

CONFIG_NAME := all

CONTAINER_RUNTIME := $(if $(filter Darwin,$(shell uname -s)), container, podman)

.PHONY: build
build: ## Build the toolbox image for the current architecture
	$(CONTAINER_RUNTIME) build -f Containerfile -t local/toolbox-dev .

.PHONY: build-multiarch
build-multiarch: ## Build multi-arch manifest (amd64 + arm64)
	$(CONTAINER_RUNTIME) build --pull --rm -f Containerfile --platform linux/amd64,linux/arm64 --manifest local/toolbox-dev .

.PHONY: test
test: build ## Build and test with a sample config
	cat tests/$(CONFIG_NAME)_config.yaml | \
	$(CONTAINER_RUNTIME) run --rm -i local/toolbox-dev bash -c '\
		cat > /tmp/test.yml && \
		sudo ansible-playbook -vv /usr/share/toolbox-dev/ansible/playbook.yml \
			--extra-vars "@/tmp/test.yml"'

.PHONY: docs
docs: ## Serve documentation locally
	mkdocs serve

.PHONY: help
help: ## Show this help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "  %-15s %s\n", $$1, $$2}'
