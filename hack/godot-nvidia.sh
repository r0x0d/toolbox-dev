#!/bin/bash

# Start godot with NVIDIA environment settings
export __GLX_VENDOR_LIBRARY_NAME=nvidia
export __NV_PRIME_RENDER_OFFLOAD=1
export __VK_LAYER_NV_optimus=NVIDIA_only
export VK_ICD_FILENAMES=/usr/share/vulkan/icd.d/nvidia_icd.json

/opt/godot/Godot_v"$GODOT_VERSION"_mono_linux_x86_64/Godot_v"$GODOT_VERSION"_mono_linux.x86_64
