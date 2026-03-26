default: help

.PHONY: build
build: ## Build the toolbox image
	podman build --pull --rm -f Containerfile -t local/toolbox-dev .

.PHONY: test
test: build ## Build and test with a sample config
	podman run --rm local/toolbox-dev bash -c \
		"printf 'languages:\n  python_development: true\n  go_development: true\n' > /tmp/test.yml && \
		sudo ansible-playbook /usr/share/toolbox-dev/ansible/playbook.yml \
			--extra-vars '@/tmp/test.yml'"

.PHONY: docs
docs: ## Serve documentation locally
	mkdocs serve

.PHONY: help
help: ## Show this help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "  %-15s %s\n", $$1, $$2}'
