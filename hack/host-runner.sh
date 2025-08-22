#!/bin/bash

# Wrapper script to execute commands in the host system through flatpak-spawn.

executable="$(basename ${0})"
exec flatpak-spawn --host "${executable}" "${@}"
