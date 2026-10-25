<h1 align=center>Dockette / Pound</h1>

<p align=center>
   <a href="https://github.com/dockette/pound/actions"><img src="https://github.com/dockette/pound/actions/workflows/docker.yml/badge.svg" alt="GitHub Actions"></a>
   <a href="https://hub.docker.com/r/dockette/pound"><img src="https://img.shields.io/docker/pulls/dockette/pound.svg" alt="Docker Hub pulls"></a>
   <a href="https://github.com/sponsors/f3l1x"><img src="https://img.shields.io/badge/sponsor-GitHub%20Sponsors-ea4aaa" alt="GitHub Sponsors"></a>
   <a href="https://github.com/orgs/dockette/discussions"><img src="https://img.shields.io/badge/support-discussions-6f42c1" alt="Support/Discussions"></a>
</p>

<p align=center>
   Legacy Docker image for <a href="https://github.com/graygnuorg/pound">Pound</a>, an HTTP/HTTPS reverse proxy and load balancer.
</p>

-----

Legacy image, kept close to the original setup. It uses the official `debian:trixie-slim` base image and the Debian
Trixie `pound` package, so changes stay focused on keeping the image buildable and testable.

## Features

- Pound from the Debian Trixie package on `debian:trixie-slim`
- Starts Pound in the foreground with `/etc/pound/config.cfg`
- Bundled configuration listens on port `80` and forwards requests with host headers matching `*.local.dev` to backend
  host `app` on port `80`

## Usage

```sh
docker run --rm -it -p 80:80 dockette/pound:latest

# use your own configuration
docker run --rm -it -p 80:80 -v "$(pwd)/pound.cfg:/etc/pound/config.cfg:ro" dockette/pound:latest
```

## Versions

| Version | Release |
|---------|---------|
| `dockette/pound:YYYY.MM.DD` | release `YYYY.MM.DD` |
| `dockette/pound:latest` | latest build of `master` |

Releases are listed on [GitHub](https://github.com/dockette/pound/releases).

## Development

```sh
make build          # build the image
make test           # check pound -V and the bundled config
make run            # run Pound on port 80
make version        # print VERSION
make release        # set today's date in VERSION
```

## Maintenance

See [how to contribute](https://github.com/dockette/.github/blob/master/CONTRIBUTING.md) to this package. Consider to
[support](https://github.com/sponsors/f3l1x) **f3l1x**. Thank you for using this package.
