#!/bin/bash

# We check for the presence of the below file to determinate if we want to set
# up the nvidia variables before executing the godot application. This is
# useful since I own a computer with nvidia and one with amd, and we don't want
# all the crap from nvidia messing around with amd.
NVIDIA_DRIVER_VERSION="/proc/driver/nvidia/version"
if [ -f "$NVIDIA_DRIVER_VERSION" ]; then
    export __GLX_VENDOR_LIBRARY_NAME=nvidia
    export __NV_PRIME_RENDER_OFFLOAD=1
    export __VK_LAYER_NV_optimus=NVIDIA_only
    export VK_ICD_FILENAMES=/usr/share/vulkan/icd.d/nvidia_icd.json
fi

# Call godot from /opt folder.
/opt/godot/Godot_v"$GODOT_VERSION"_mono_linux_x86_64/Godot_v"$GODOT_VERSION"_mono_linux.x86_64
