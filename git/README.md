# Configurations for [`Git`](https://github.com/git/git)

## Usage

- install GSM to manage authentication,  see [Install instructions](https://github.com/git-ecosystem/git-credential-manager/blob/release/docs/install.md).
- set your identity, e.g.,

  ```bash
  git config set --global user.name "${YOUR_NAME}"
  git config set --global user.email "${YOUR_EMAIL}"
  ```

- (Optional) set the editor used for message editing invoked by commands such as `commit` and `tag`

  ```bash
  git config set --global core.editor "${GIT_EDITOR}"
  ```

- use `main` as the default branch name when initializing a new repository

  ```bash
  git config set --global init.defaultBranch "main"
  ```

- only fast-forward merges are allowed

  ```bash
  git config set --global pull.ff only
  ```

- enable a nice output for submodules on `diff` and `status`, see [Git Tools - Submodules](https://git-scm.com/book/en/v2/Git-Tools-Submodules)

  ```bash
  git config set --global diff.submodule log
  git config set --global status.submodulesummary true
  ```

- enable commit signature verification, see [About commit signature verification](https://docs.github.com/en/authentication/managing-commit-signature-verification/about-commit-signature-verification)

  ```bash
  git config set --global commit.gpgsign true
  ```

- install [`git-lfs`](https://github.com/git-lfs/git-lfs) to manage large files
and disable downloading large files on `clone` or `pull`

  ```bash
  git lfs install --skip-smudge
  ```

- Use [`gitignore.io`](https://www.toptal.com/developers/gitignore) to create system-wise `gitignore` files.

## Reference

- [git-tutorial](https://github.com/git/git/blob/master/Documentation/gittutorial.adoc)
- [git-config](https://github.com/git/git/blob/master/Documentation/git-config.adoc)
