# Install and setup useful applications with pipx

It is good to install globally few applications useful for developing with Python. We
will show here how it can be done with [pipx](https://github.com/pypa/pipx).

```{note}

Pipx installs applications in isolated and dedicated virtual environments, and it is
completely transparent for the users.

```

## Install pipx

One first needs to install pipx itself. On Debian (and other Linux distributions), one
can run:

```sh
python3 -m pip install pipx
~/.local/bin/pipx ensurepath
```

## Install and setup Mercurial

We start by installing [Mercurial], which is a version control application (like Git, but
easier and safer) and which can be used to interact with Git repositories hosted on
Github or on Gitlab instances:

```sh
pipx install mercurial
pipx inject mercurial hg-git hg-evolve hg-fluiddyn
```

We explain [here](./mercurial/install-setup.md) how to finalize the Mercurial installation.

## Install and setup xonsh

```sh
# a shell much user friendly that bash
pipx install 'xonsh[full]'
pipx inject xonsh xontrib-vox
```

One can setup xonsh by running `xonfig web` and then adding the line
`xontrib load coreutils vox` in the file `~/.xonshrc`.

## Install PDM, Nox and mdformat

Finally, let's add few other applications with pipx:

```sh
# https://pdm-project.org
pipx install pdm
pipx install nox
pipx install mdformat
pipx inject mdformat mdformat-myst
pipx install pypi-timemachine
```

[mercurial]: https://www.mercurial-scm.org/
