[![license](https://img.shields.io/github/license/xpack-3rd-party/arm-cmsis-core-m-xpack)](https://github.com/xpack-3rd-party/arm-cmsis-core-m-xpack/blob/xpack/LICENSE)
[![CI on Push](https://github.com/xpack-3rd-party/arm-cmsis-core-m-xpack/workflows/CI%20on%20Push/badge.svg)](https://github.com/xpack-3rd-party/arm-cmsis-core-m-xpack/actions?query=workflow%3A%22CI+on+Push%22)
[![GitHub issues](https://img.shields.io/github/issues/xpack-3rd-party/arm-cmsis-core-m-xpack.svg)](https://github.com/xpack-3rd-party/arm-cmsis-core-m-xpack/issues/)
[![GitHub pulls](https://img.shields.io/github/issues-pr/xpack-3rd-party/arm-cmsis-core-m-xpack.svg)](https://github.com/xpack-3rd-party/arm-cmsis-core-m-xpack/pulls)

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

- <https://github.com/xpack-3rd-party/arm-cmsis-core-m-xpack.git>

To clone the stable branch (`xpack`), run the following commands in a
terminal (on Windows use the _Git Bash_ console):

```sh
rm -rf ~/Work/xpack-3rd-party/arm-cmsis-core-m-xpack.git && \
mkdir -p ~/Work/xpack-3rd-party && \
git clone \
  https://github.com/xpack-3rd-party/arm-cmsis-core-m-xpack.git \
  ~/Work/xpack-3rd-party/arm-cmsis-core-m-xpack.git
```

For development purposes, clone the `xpack-develop` branch:

```sh
rm -rf ~/Work/xpack-3rd-party/arm-cmsis-core-m-xpack.git && \
mkdir -p ~/Work/xpack-3rd-party && \
git clone \
  --branch xpack-develop \
  https://github.com/xpack-3rd-party/arm-cmsis-core-m-xpack.git \
  ~/Work/xpack-3rd-party/arm-cmsis-core-m-xpack.git
```

## Development setup

### Link to central store

When installed as a dependency to a project, the folder in the central
store is set to read-only, to prevent inadvertend changes.

For development purposes, sometimes projects need writable access.

This can be achieved via links, similarly to npm links.

In practical terms, after downloading this project in the
work area, make it available via a link from the central store:

```sh
cd arm-cmsis-core-m-xpack.git
xpm link
```

Later, in the project using this package, replace the link to the read-only
folder with a link to the writable folder:

```sh
cd project-using-arm-cmsis-core-m-xpack
xpm link @xpack-3rd-party/arm-cmsis-core-m
```

### Install dependencies

With a clean slate, install dependencies:

```sh
cd arm-cmsis-core-m-xpack.git
xpm install --all-configs
```

## Run tests

The project includes unit tests.

To perform the tests, run the usual xpm sequence:

```sh
cd arm-cmsis-core-m-xpack.git
xpm run test-all
```

## Continuous Integration

All available tests are also performed on GitHub Actions, as the
[CI on Push](https://github.com/xpack-3rd-party/arm-cmsis-core-m-xpack/actions?query=workflow%3A%22CI+on+Push%22)
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

The new version will look `5.4.0-3`. The third number is 0, since Arm uses
only two numbers. The fourth number is the xPack release number
of this version.

### Fix possible open issues

Check GitHub issues and pull requests:

- <https://github.com/xpack-3rd-party/arm-cmsis-core-m-xpack/issues/>

and fix them; assign them to a milestone (like `5.4.0-3`).

### Check `README.md`

Normally `README.md` should not need changes, but better check.
Information related to the new version should not be included here,
but in the version specific release page.

### Update versions in `README` files

- update version in `README-MAINTAINER.md`
- update version in `README.md`

### Update `CHANGELOG.md`

- open the `CHANGELOG.md` file
- check if all previous fixed issues are in
- add a new entry like _- v5.4.0-3 prepared_
- commit with a message like _prepare v5.4.0-3_

### Prepare a new blog post

In the `micro-os-plus/web-jekyll` GitHub repo:

- select the `develop` branch
- add a new file to `_posts/arm-cmsis-core-m/releases`
- name the file like `2022-01-15-arm-cmsis-core-m-v5-4-0-1-released.md`
- name the post like: **Arm CMSIS Core v5.4.0-3 released**
- update the `date:` field with the current date
- update the GitHub Actions URLs using the actual test pages

If any, refer to closed
[issues](https://github.com/xpack-3rd-party/arm-cmsis-core-m-xpack/issues/)
as:

- **[Issue:\[#1\]\(...\)]**.

### Publish on the npmjs.com server

- select the `xpack-develop` branch
- commit all changes
- `npm pack` and check the content of the archive, which should list
  only the `CMSIS/Core/Include` folder, `LICENSE-Arm.txt`,
  the CMake files,
  `package.json`, the `README.md`, `LICENSE` and `CHANGELOG.md`;
  possibly adjust `.npmignore`
- push the `xpack-develop` branch to GitHub
- `npm version 5.4.0-3`
- the `postversion` npm script should also update tags via `git push origin --tags`
- wait for the CI job to complete
  (<https://github.com/xpack-3rd-party/arm-cmsis-core-m-xpack/actions/workflows/CI.yml>)
- `npm publish --tag next` (use `--access public` when publishing for
  the first time)

The version is visible at:

- <https://www.npmjs.com/package/@xpack-3rd-party/arm-cmsis-core-m?activeTab=versions>

## Update the repo

When the package is considered stable:

- with Sourcetree
- merge `xpack-develop` into `xpack`
- push to GitHub
- select `xpack-develop`

## Tag the npm package as `latest`

When the release is considered stable, promote it as `latest`:

- `npm dist-tag ls @xpack-3rd-party/arm-cmsis-core-m`
- `npm dist-tag add @xpack-3rd-party/arm-cmsis-core-m@5.4.0-3 latest`
- `npm dist-tag ls @@xpack-3rd-party/arm-cmsis-core-m`

## Announce to the community

Post an announcement to the forum.

## Share on Twitter

- in a separate browser windows, open [TweetDeck](https://tweetdeck.twitter.com/)
- using the `@micro_os_plus` account
- paste the release name like **Arm CMSIS Core v5.4.0-3 released**
- paste the link to the Web page release
- click the **Tweet** button
