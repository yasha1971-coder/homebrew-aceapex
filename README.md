# Homebrew tap for ACEAPEX

[ACEAPEX](https://github.com/yasha1971-coder/aceapex) — a parallel block LZ77 compressor with random access
(format ACEPX2), aimed at genomes.

```
brew install yasha1971-coder/aceapex/aceapex
```

Version: **2.6.4** — release notes and the static Linux package:
https://github.com/yasha1971-coder/aceapex/releases/tag/v2.6.4

The formula builds the CLI from the source archive of the tag with CMake (Release, no CPU-specific flags) against
Homebrew's zstd. Its test compresses and decompresses a small file and compares the bytes, and checks that
`aceapex --version` reports the formula's version. CI (`.github/workflows/tests.yml`) runs
`brew install --build-from-source` and `brew test` on macOS (arm64) and Ubuntu.

Usage: `aceapex c --in FILE --out FILE.aet`, `aceapex d --in FILE.aet --out FILE`; see the
[ACEAPEX README](https://github.com/yasha1971-coder/aceapex#readme).

Problems with ACEAPEX itself: https://github.com/yasha1971-coder/aceapex/issues.
