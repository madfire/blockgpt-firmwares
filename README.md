# BlockGPT Firmwares

This repository stores firmware payloads used by BlockGPT Link for supported hardware targets.

## Current payload

- `arduino/`: Arduino HEX firmwares
- `microPython/`: MicroPython and MaixPy firmware binaries

## Release convention

The current firmware downloader fetches all assets from the latest release. A single archive is enough for the default workflow.

Recommended asset name:

- `blockgpt-firmwares.zip`

## Build release assets

```bash
./scripts/package-release.sh
```

The script writes the packaged firmware archive into `dist/`.

## Product role

This repository keeps firmware delivery separate from the main desktop package so BlockGPT can evolve hardware support without forcing a full application reinstall.
