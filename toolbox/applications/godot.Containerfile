FROM quay.io/toolbox-dev/languages/dotnet:latest

# ARG to override Godot version
ARG GODOT_VERSION="4.5.1-stable"
ARG CHOWN_ID=1000:1000

COPY --chown=${CHOWN_ID} hack/godot-wrapper.sh /usr/local/bin/godot-wrapper
COPY hack/setup.sh /tmp/setup.sh

ENV PKGS ca-certificates \
    mesa-libGL \
    mesa-libGLU \
    libXcursor \
    libXinerama \
    libXrandr \
    libXi \
    alsa-lib \
    pulseaudio-libs \
    libdecor \
    libwayland-egl \
    libwayland-cursor \
    libxkbcommon

ENV GODOT_VERSION=${GODOT_VERSION}
ENV DOWNLOAD_URL="https://github.com/godotengine/godot-builds/releases/download/${GODOT_VERSION}/Godot_v${GODOT_VERSION}_mono_linux_x86_64.zip"

RUN /tmp/setup.sh

# Download and install Godot
RUN echo "Downloading Godot ${GODOT_VERSION} from: $DOWNLOAD_URL" && \
    curl -L -o /tmp/godot.zip "$DOWNLOAD_URL" && \
    mkdir -p /opt/godot && \
    unzip -q /tmp/godot.zip -d /opt/godot

LABEL purpose="A toolbox container for Godot application"
