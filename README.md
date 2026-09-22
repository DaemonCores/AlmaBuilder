# AlmaBuilder

<p align="center">
  <img src="https://raw.githubusercontent.com/DaemonCores/.github/refs/heads/main/assets/banner.svg" alt="AstralEmu Banner" width="100%"/>
</p>

<p>
  <strong align="left">Simplify and Innovate for Everyone.</strong>
  <a href="https://github.com/DaemonCores/debian-bootc/wiki"><img align="right" src="https://img.shields.io/badge/Wiki-FFFFFF?style=for-the-badge&logoColor=white" alt="Documentation"/></a>
  <a href="https://github.com/orgs/DaemonCores/discussions"><img align="right" src="https://img.shields.io/badge/Community-000000?style=for-the-badge&logoColor=white" alt="Community"/></a>
  <a href="https://github.com/DaemonCores/debian-bootc"><img align="right" src="https://img.shields.io/badge/Base_debian_for_all_project-A81D33?style=for-the-badge&logo=debian&logoColor=white" alt="Debian Bootc"/></a>
  
  <em>Identify gaps and fill them, make improvements where possible, but above all, empower developers to offer more to users.</em>
</p>

---

AlmaBuilder is a compact reference project for building an AlmaLinux bootc image and generating a network installer ISO for it.

It is a prototype, not the primary DaemonCores base image. The production-oriented bootc work lives in [`debian-bootc`](https://github.com/DaemonCores/debian-bootc).

## Repository contents

| Path | Purpose |
| --- | --- |
| `Dockerfile` | Extends `quay.io/almalinuxorg/almalinux-bootc:latest` and declares a bootc-compatible OCI image. |
| `iso.ks` | Kickstart configuration that asks Anaconda to install the image from GHCR. |
| `.github/workflows/bootc-build.yml` | Builds the image and publishes it to `ghcr.io/daemoncores/almabuilder`. |
| `.github/workflows/iso.yml` | Downloads the AlmaLinux 9 boot ISO, injects the Kickstart URL, and uploads the rebuilt ISO to the `install-iso` release. |

## Published artifacts

- Container image: `ghcr.io/daemoncores/almabuilder:latest`
- Installer release: [`install-iso`](https://github.com/DaemonCores/AlmaBuilder/releases/tag/install-iso)

The installer is network-dependent: Anaconda downloads `iso.ks` from GitHub and pulls the current image from GHCR during installation. It does not embed the operating-system image.

## Build locally

```bash
docker build -t almabuilder:local .
```

The GitHub image workflow expects a `PAT_PKG` Actions secret with permission to publish packages to GHCR. The ISO workflow uses the repository `GITHUB_TOKEN` to create or update the release.

## Current scope

AlmaBuilder intentionally contains only the base image, Kickstart file, and two publishing workflows. It does not share the package builder, QEMU runtime tests, signed APT repository, or offline installer pipeline used by the Debian-based projects.

---

<p>
  <strong align="left">Made with ⭐ by the DaemonCores community</strong>
  <a href="https://github.com/DaemonCores/debian-bootc/wiki"><img align="right" src="https://img.shields.io/badge/Wiki-FFFFFF?style=for-the-badge&logoColor=white" alt="Documentation"/></a>
  <a href="https://github.com/orgs/DaemonCores/discussions"><img align="right" src="https://img.shields.io/badge/Community-000000?style=for-the-badge&logoColor=white" alt="Community"/></a>
  <a href="https://github.com/DaemonCores/debian-bootc"><img align="right" src="https://img.shields.io/badge/Base_debian_for_all_project-A81D33?style=for-the-badge&logo=debian&logoColor=white" alt="Debian Bootc"/></a>
</p>
