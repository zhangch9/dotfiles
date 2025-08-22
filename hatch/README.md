# Configurations for [`Hatch`](https://hatch.pypa.io/latest/)

## Usage

- copy the following lines to `pyproject.toml`

  ```toml
  [build-system]
  requires = [
    # * supports PEP 639, see https://packaging.python.org/en/latest/guides/writing-pyproject-toml/#license-and-license-files
    "hatchling >= 1.27",
    # * uses VCS (e.g., Git) to determine project versions
    "hatch-vcs",
  ]
  build-backend = "hatchling.build"


  [tool.hatch.version]
  source = "vcs"


  [tool.hatch.version.raw-options]
  version_scheme = "python-simplified-semver"
  local_scheme = "no-local-version"


  # TODO: replaces `pkg` with your package
  [tool.hatch.build.hooks.vcs]
  version-file = "src/pkg/_version.py"
  ```

- (optional) if direct references are required for some dependencies, add the following lines in `pyproject.toml`

  ```toml
  # * See: [direct references](https://peps.python.org/pep-0440/#direct-references)
  [tool.hatch.metadata]
  allow-direct-references = true
  ```

## Reference

- [`hatch-vcs`](https://github.com/ofek/hatch-vcs)
- [Allowing direct references](https://hatch.pypa.io/latest/config/metadata/#allowing-direct-references)
