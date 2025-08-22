# Client Configurations for [`OpenSSH`](https://www.openssh.com/)

## Usage

- add the following lines to the top of `~/.ssh/config`

  ```text
  # Recommended configurations in [The Art of Command Line](https://github.com/jlevy/the-art-of-command-line)
  Host *
    # keeps connections alive
    TCPKeepAlive yes
    ServerAliveInterval 60
    ServerAliveCountMax 6
    # uses compression in case of low-bandwidth connections
    Compression yes
    # enables multiplexing
    ControlMaster auto
    ControlPath ~/.ssh/sockets/%C
    ControlPersist yes
    # forwards the auth agent to the remote
    ForwardAgent yes
  ```

## Reference

[ssh_config](https://man.openbsd.org/ssh_config)
