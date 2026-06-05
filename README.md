<h1 align=center>Dockette / Pound</h1>

<p align=center>
   <a href="https://github.com/dockette/pound/actions"><img src="https://github.com/dockette/pound/actions/workflows/docker.yml/badge.svg" alt="GitHub Actions"></a>
   <a href="https://hub.docker.com/r/dockette/pound"><img src="https://img.shields.io/docker/pulls/dockette/pound.svg" alt="Docker Hub pulls"></a>
   <a href="https://github.com/sponsors/f3l1x"><img src="https://img.shields.io/badge/sponsor-GitHub%20Sponsors-ea4aaa" alt="GitHub Sponsors"></a>
   <a href="https://github.com/orgs/dockette/discussions"><img src="https://img.shields.io/badge/support-discussions-6f42c1" alt="Support/Discussions"></a>
</p>

<p align=center>
   Legacy Docker image for <a href="https://www.apsis.ch/pound.html">Pound</a>, an HTTP/HTTPS reverse proxy and load balancer.
</p>

-----

## Usage

```bash
docker run --rm -it \
  -p 80:80 \
  dockette/pound:latest
```

The image starts Pound in the foreground with `/etc/pound/config.cfg`.

## Configuration

The bundled configuration listens on port `80` and forwards requests with host headers matching `*.local.dev` to backend host `app` on port `80`.

To use your own configuration:

```bash
docker run --rm -it \
  -p 80:80 \
  -v "$(pwd)/pound.cfg:/etc/pound/config.cfg:ro" \
  dockette/pound:latest
```

## Legacy Constraints

This image is intentionally kept close to the original legacy setup. It uses the historical `dockette/debian:jessie` base image and Debian Jessie `pound` package, so changes should stay focused on keeping the existing image buildable and testable.

## Development

```bash
make build
make test
make run
```

## Maintenance

See [how to contribute](https://github.com/dockette/.github/blob/master/CONTRIBUTING.md) to this package. Consider to [support](https://github.com/sponsors/f3l1x) **f3l1x**. Thank you for using this package.
