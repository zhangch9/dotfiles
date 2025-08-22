# Configurations for [`mypy`](https://mypy.readthedocs.io/en/stable/index.html)

## Usage

- copy the content in `mypy.ini` to your working directory

  ```bash
  cp "$(pwd -P)/mypy.ini" "${WORKDIR}"
  ```

- enable the `pydantic.mypy` plugin when `pydantic` is used, see [Mypy](https://docs.pydantic.dev/latest/integrations/mypy/)

  ```ini
  [mypy]
  plugins = pydantic.mypy
  ```

## Reference

[The mypy configuration file](https://mypy.readthedocs.io/en/stable/config_file.html)
