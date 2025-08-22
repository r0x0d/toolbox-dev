# Toolbox Development Images

This is my personal set of toolbox development boxes (and general use). 

Inpisration for this repository came from [travier/quay-containerfiles](https://github.com/travier/quay-containerfiles).

## Toolboxes available

Currently, the boxes available in this repository are: 

|Base|Box|Purpose|Where|
|---|---|---|---|
|Fedora 42|toolbox-base|General toolbox for regular use|[toolbox-base](https://quay.io/repository/r0x0d/toolbox-base)|
|[toolbox-base](https://quay.io/repository/r0x0d/toolbox-base)|toolbox-python|General toolbox for python development|[toolbox-python](https://quay.io/repository/r0x0d/toolbox-python)|
|[toolbox-base](https://quay.io/repository/r0x0d/toolbox-base)|toolbox-node|General toolbox for node development|[toolbox-node](https://quay.io/repository/r0x0d/toolbox-node)|
|[toolbox-base](https://quay.io/repository/r0x0d/toolbox-base)|toolbox-ruby|General toolbox for ruby development|[toolbox-ruby](https://quay.io/repository/r0x0d/toolbox-ruby)|
|[toolbox-base](https://quay.io/repository/r0x0d/toolbox-base)|toolbox-rust|General toolbox for rust development|[toolbox-rust](https://quay.io/repository/r0x0d/toolbox-rust)|
|[toolbox-base](https://quay.io/repository/r0x0d/toolbox-base)|toolbox-dotnet|General toolbox for dotnet development|[toolbox-dotnet](https://quay.io/repository/r0x0d/toolbox-dotnet)|

## Adding new toolboxes

Currently, all toolboxes per environment are located under the `toolbox`
folder. If you wish to do a new toolbox environment, just simply add your
`<environment>.Containerfile` inside that folder, and you're ready to go.

As default, all images use as base the `base.Containerfile`, or
`quay.io/r0x0d/toolbox-base:latest` to keep them up-to-date when a new pipeline
build is triggered.

## Building locally

To build the images locally, one must need to install
[podman](https://podman.io/), once podman is installed, just run the following: 

```bash
# To generate the base image
make base 

# To generate the python image
make python
```

All image building options follow the
[IMAGES](https://github.com/r0x0d/toolbox-dev/blob/main/Makefile#L1) variable
in our Makefile.

## Making use of the toolbox images

In order to use any of the boxes provided by this repository, you can just do: 

```bash
# For creating a python box
toolbox create --image quay.io/r0x0d/toolbox-python python-dev
```

And the same applies for all images shipped in this repository. That will pick
whatever is in quay and pull the latest data. 

If, whoever, you want to just use the locally build image, we have two
pre-defined commands in the Makefile to assist with that.

```bash
# To create a python toolbox
make toolbox-create-python

# To enter the newly created python box
make toolbox-enter-python
```

## Future plans

A non-exhaustive list of updates that are needed for this project as we move
into the future.

- [ ] Split the toolboxes into folders to better organize the builds
    - [ ] `environment` folder for the environmental images ({python,dotnet,node}.Containerfile and etc...)
    - [ ] `app` folder for the application images ({emacs,vscode}.Containerfiler and etc...)
