# Toolbox Development Images

This is my personal set of toolbox development boxes (and general use). 

Inpisration for this repository came from [travier/quay-containerfiles](https://github.com/travier/quay-containerfiles).

## Toolboxes available

Currently, the boxes available in this repository are: 

|Base|Box|Purpose|Where|
|---|---|---|---|
|Fedora 42|toolbox-base|General toolbox for regular use|[toolbox-base](https://quay.io/repository/r0x0d/toolbox-base)|
|[toolbox-base](https://quay.io/repository/r0x0d/toolbox-base)|toolbox-python|General toolbox for python development|[toolbox-python](https://quay.io/repository/r0x0d/toolbox-python)|

## Building locally

To build the images locally, one must need to install [podman](https://podman.io/), once podman is installed, just run the following: 

```bash
# To generate the base image
make base 

# To generate the python image
make python
```