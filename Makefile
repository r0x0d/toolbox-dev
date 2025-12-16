IMAGES := $(patsubst toolbox/%,%,$(basename $(wildcard toolbox/*.Containerfile toolbox/**/*.Containerfile)))

default: help

.PHONY: $(IMAGES)
$(IMAGES): ## Build a image
	podman build --pull --rm -f "toolbox/$@.Containerfile" -t "local/toolbox-$@" .

.PHONY: targets
targets:
	$(foreach img,$(IMAGES),$(info $(img)))
	@echo "Total: $(words $(IMAGES)) images"
