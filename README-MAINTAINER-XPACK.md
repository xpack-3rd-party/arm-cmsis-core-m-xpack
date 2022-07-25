[![license](https://img.shields.io/github/license/xpack-3rd-party/arm-cmsis-core-xpack)](https://github.com/xpack-3rd-party/arm-cmsis-core-xpack/blob/xpack/LICENSE)
[![CI on Push](https://github.com/xpack-3rd-party/arm-cmsis-core-xpack/actions/workflows/CI.yml/badge.svg)](https://github.com/xpack-3rd-party/arm-cmsis-core-xpack/actions/workflows/CI.yml)
[![GitHub issues](https://img.shields.io/github/issues/xpack-3rd-party/arm-cmsis-core-xpack.svg)](https://github.com/xpack-3rd-party/arm-cmsis-core-xpack/issues/)
[![GitHub pulls](https://img.shields.io/github/issues-pr/xpack-3rd-party/arm-cmsis-core-xpack.svg)](https://github.com/xpack-3rd-party/arm-cmsis-core-xpack/pulls)

# Maintainer info

## Prerequisites

A recent [xpm](https://xpack.github.io/xpm/), which is a portable
[Node.js](https://nodejs.org/) command line application.

It is recommended to update to the latest version with:

```sh
npm install --global xpm@latest
```

## Project repository

The project is hosted on GitHub as:

- <https://github.com/xpack-3rd-party/arm-cmsis-core-xpack.git>

To clone the stable branch (`xpack`), run the following commands in a
terminal (on Windows use the _Git Bash_ console):

```sh
rm -rf ~/Work/xpack-3rd-party/arm-cmsis-core-xpack.git && \
mkdir -p ~/Work/xpack-3rd-party && \
git clone \
  https://github.com/xpack-3rd-party/arm-cmsis-core-xpack.git \
  ~/Work/xpack-3rd-party/arm-cmsis-core-xpack.git
```

For development purposes, clone the `xpack-develop` branch:

```sh
rm -rf ~/Work/xpack-3rd-party/arm-cmsis-core-xpack.git && \
mkdir -p ~/Work/xpack-3rd-party && \
git clone \
  --branch xpack-develop \
  https://github.com/xpack-3rd-party/arm-cmsis-core-xpack.git \
  ~/Work/xpack-3rd-party/arm-cmsis-core-xpack.git
```

## Development setup

### Link to central store

When installed as a dependency to a project, the folder in the central
store is set to read-only, to prevent inadvertent changes.

For development purposes, sometimes projects need writeable access.

This can be achieved via links, similarly to npm links.

In practical terms, after downloading this project in the
work area, make it available via a link from the central store:

```sh
cd arm-cmsis-core-xpack.git
xpm link
```

Later, in the project using this package, replace the link to the read-only
folder with a link to the writeable folder:

```sh
cd project-using-arm-cmsis-core-xpack
xpm link @xpack-3rd-party/arm-cmsis-core
```

### Install dependencies

With a clean slate, install dependencies:

```sh
cd arm-cmsis-core-xpack.git
xpm install --all-configs
```

## Run tests

The project includes unit tests.

To perform the tests, run the usual xpm sequence:

```sh
cd arm-cmsis-core-xpack.git
xpm run test-all
```

## Continuous Integration

All available tests are also performed on GitHub Actions, as the
[CI on Push](https://github.com/xpack-3rd-party/arm-cmsis-core-xpack/actions/workflows/CI.yml)
workflow.

Note: not yet used.

## Code formatting

The Arm code uses a manual formatting, and should not be
formatted with clang-format.

## How to publish

### Merge upstream

- define `upstream` as <https://github.com/ARM-software/CMSIS_5.git>
- switch to `master` branch
- merge from `upstream/master`
- switch to `xpack-develop` branch
- merge next release from `master`

### Increase the version

Check the `CMSIS/Core/Include/cmsis_version.h` for the two version digits;
the value in `ARM.CMSIS.pdsc` may not be up to date.

The new version will look `5.4.0-6`. The third number is 0, since Arm uses
only two numbers. The fourth number is the xPack release number
of this version.

### Fix possible open issues

Check GitHub issues and pull requests:

- <https://github.com/xpack-3rd-party/arm-cmsis-core-xpack/issues/>

and fix them; assign them to a milestone (like `5.4.0-6`).

### Check `README.md`

Normally `README.md` should not need changes, but better check.
Information related to the new version should not be included here,
but in the version specific release page.

### Update versions in `README` files

- update version in `README-MAINTAINER-XPACK.md`
- update version in `README.md`

### Update `CHANGELOG-XPACK.md`

- open the `CHANGELOG-XPACK.md` file
- check if all previous fixed issues are in
- add a new entry like _- v5.4.0-6 prepared_
- commit with a message like _prepare v5.4.0-6_

### Publish on the npmjs.com server

- select the `xpack-develop` branch
- commit all changes
- `npm pack` and check the content of the archive, which should list
  only `package.json`, `README.md`, `LICENSE`, `CHANGELOG-XPACK.md`,
  the sources and CMake/meson files;
  possibly adjust `.npmignore`
- push the `xpack-develop` branch to GitHub
- `npm version 5.4.0-6`
- the `postversion` npm script should also update tags via `git push origin --tags`
- wait for the CI job to complete
  (<https://github.com/xpack-3rd-party/arm-cmsis-core-xpack/actions/workflows/CI.yml>)
- `npm publish --tag next` (use `npm publish --access public` when
  publishing for the first time)

The version is visible at:

- <https://www.npmjs.com/package/@xpack-3rd-party/arm-cmsis-core?activeTab=versions>

## Update the repo

When the package is considered stable:

- with a Git client (VS Code is fine)
- merge `xpack-develop` into `xpack`
- push to GitHub
- select `xpack-develop`

## Tag the npm package as `latest`

When the release is considered stable, promote it as `latest`:

- `npm dist-tag ls @xpack-3rd-party/arm-cmsis-core`
- `npm dist-tag add @xpack-3rd-party/arm-cmsis-core@5.4.0-6 latest`
- `npm dist-tag ls @xpack-3rd-party/arm-cmsis-core`
