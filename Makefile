IMAGES := base python node ruby

default: help


# Toolbox create rule
define TOOLBOX_CREATE_TEMPLATE
toolbox-create-$(1):
	toolbox create --image localhost/local/toolbox-$(1) $(1)-dev
endef

# Toolbox enter rule
define TOOLBOX_ENTER_TEMPLATE
toolbox-enter-$(1):
	toolbox enter $(1)-dev
endef

# Define all toolbox-related phony targets
.PHONY: $(addprefix toolbox-create-,$(IMAGES)) $(addprefix toolbox-enter-,$(IMAGES))

# Generate rules using eval
$(foreach image,$(IMAGES),$(eval $(call TOOLBOX_CREATE_TEMPLATE,$(image))))
$(foreach image,$(IMAGES),$(eval $(call TOOLBOX_ENTER_TEMPLATE,$(image))))

.PHONY: $(IMAGES)
$(IMAGES): ## Build a image
	podman build --pull --rm -f "toolbox/$@.Containerfile" -t "local/toolbox-$@" "."
