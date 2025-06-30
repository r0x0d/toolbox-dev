default: help

define build_image
    $(eval $@_TYPE = $(1))
	podman build --pull --rm -f "toolbox/${$@_TYPE}.Containerfile" -t "local/toolbox-${$@_TYPE}" "."
endef


.PHONY: base
base: ## Build the base image
	@$(call build_image, base)


.PHONY: python
python: ## Build the python image
	$(call build_image, python)


.PHONY: help
help: ## Show available make commands
	@echo 'Usage: make <OPTIONS> ... <TARGETS>'
	@echo ''
	@echo 'Available targets are:'
	@echo ''
	@grep -E '^[ a-zA-Z0-9_.-]+:.*?## .*$$' $(MAKEFILE_LIST) | \
		awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-25s\033[0m %s\n", $$1, $$2}'
	@echo ''