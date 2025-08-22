# Configurations for [`Zellij`](https://zellij.dev/)

## Usage

```bash
# (Optional) backup the existing configuration directory
mv "${XDG_CONFIG_HOME}/zellij "${XDG_CONFIG_HOME}/zellij.bak"
ln -s "$(pwd -P)" "${XDG_CONFIG_HOME}"
```

The default configuration file can be obtained by executing the following command:

```bash
zellij setup --dump-config > default.kdl
```

## Reference

[Configuration](https://zellij.dev/documentation/configuration.html)
