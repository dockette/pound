# AGENTS.md

## Project

Dockette Pound builds `dockette/pound`, a legacy Pound HTTP/HTTPS reverse proxy and load balancer image. The image listens on port `80` and uses `/etc/pound/config.cfg` copied from `pound/pound.cfg`.

## Images

- Default image: `dockette/pound:latest`.
- Build context: repository root `.` with `Dockerfile` and `pound/pound.cfg`.
- Base image: `dockette/debian:jessie`.
- The image installs the Debian Jessie `pound` package and starts `pound -f /etc/pound/config.cfg`.
- GitHub Actions builds `linux/amd64` for tests, then publishes `linux/amd64,linux/arm64` through the shared Dockette Docker workflow on `master` and the weekly schedule.

## Commands

- `make build` builds `${DOCKER_IMAGE}:${DOCKER_TAG}` from `.`.
- `make test` runs `pound -V` and validates `/etc/pound/config.cfg` with `pound -c -f` inside the built image.
- `make run` starts the image locally with `80:80` published.

## Testing Notes

- Prefer `make test` after Dockerfile or `pound/pound.cfg` changes.
- Use `make -n build test run` to dry-run command wiring without requiring Docker.
- The smoke test requires Docker and the image to be built first.

## Guidelines

- Keep changes focused on maintaining the legacy image; avoid broad modernization unless needed for build viability.
- Keep `Dockerfile`, `Makefile`, README, `pound/pound.cfg`, and `.github/workflows/docker.yml` aligned.
- Prefer `DOCKER_*` names for Docker-related Makefile variables.
- Place `.PHONY: <target>` directly above each Makefile target.
- Keep README badges and maintenance sections consistent with other Dockette image repos.
