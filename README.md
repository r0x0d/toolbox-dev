# Toolbox Development Images

This is my personal set of toolbox development boxes (and general use).

Inpisration for this repository came from [travier/quay-containerfiles](https://github.com/travier/quay-containerfiles).

## Toolboxes available

Currently, the boxes available in this repository are:

<!-- START OF AUTOMATIC TABLE GENERATION -->

|Base|Where|Purpose|
|---|---|---|
|[default:latest](https://quay.io/repository/toolbox-dev/default:latest)|[applications/cursor](https://quay.io/repository/toolbox-dev/applications/cursor)|A toolbox container for Cursor application|
|[default:latest](https://quay.io/repository/toolbox-dev/default:latest)|[applications/vscode](https://quay.io/repository/toolbox-dev/applications/vscode)|A toolbox container for VSCode application|
|[Fedora 43](registry.fedoraproject.org/fedora-toolbox:43)|[default](https://quay.io/repository/toolbox-dev/default)|General toolbox for personal use|
|[default:latest](https://quay.io/repository/toolbox-dev/default:latest)|[languages/cpp](https://quay.io/repository/toolbox-dev/languages/cpp)|General toolbox for cpp development|
|[default:latest](https://quay.io/repository/toolbox-dev/default:latest)|[languages/dotnet](https://quay.io/repository/toolbox-dev/languages/dotnet)|General toolbox for dotnet development|
|[default:latest](https://quay.io/repository/toolbox-dev/default:latest)|[languages/go](https://quay.io/repository/toolbox-dev/languages/go)|General toolbox for go development|
|[default:latest](https://quay.io/repository/toolbox-dev/default:latest)|[languages/node](https://quay.io/repository/toolbox-dev/languages/node)|General toolbox for node development|
|[default:latest](https://quay.io/repository/toolbox-dev/default:latest)|[languages/python](https://quay.io/repository/toolbox-dev/languages/python)|General toolbox for python development|
|[default:latest](https://quay.io/repository/toolbox-dev/default:latest)|[languages/ruby](https://quay.io/repository/toolbox-dev/languages/ruby)|General toolbox for ruby development|
|[default:latest](https://quay.io/repository/toolbox-dev/default:latest)|[languages/rust](https://quay.io/repository/toolbox-dev/languages/rust)|General toolbox for rust development|

<!-- END OF AUTOMATIC TABLE GENERATION -->

## Adding new toolboxes

Currently, all toolboxes per environment are located under the `toolbox`
folder. If you wish to do a new toolbox environment, just simply add your
`<environment>.Containerfile` inside that folder, and you're ready to go (separated by environment, language and application).

As default, all images use as base the `default.Containerfile`, or
`quay.io/toolbox-dev/default:latest` to keep them up-to-date when a new pipeline
build is triggered.

## Building locally

To build the images locally, one must need to install
[podman](https://podman.io/), once podman is installed, just run the following:

```bash
# To generate the default image
make default

# To generate the python image
make languages/python

# To generate an application toolbox
make applications/vscode
```

A list of targets can be seen at `make targets`.

## Making use of the toolbox images

In order to use any of the boxes provided by this repository, you can just do:

```bash
# For creating a python box
toolbox create --image quay.io/toolbox-dev/languages/python python-dev
toolbox create --image quay.io/toolbox-dev/applications/vscode vscode
```

And the same applies for all images shipped in this repository. That will pick
whatever is in quay and pull the latest data.
