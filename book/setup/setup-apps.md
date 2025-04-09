# Install and setup useful applications with pipx

It is good to install globally few applications useful for developing with Python. We
will show here how it can be done with [pipx](https://github.com/pypa/pipx).

```{note}

Pipx installs applications in isolated and dedicated virtual environments, and it is
completely transparent for the users.

```

## Install pipx

One first needs to install [Pipx] itself. Some installation methods can be:

`````{tab-set}

````{tab-item} Windows
```sh
py -m pip install pipx
```
````

````{tab-item} macOS
Install directly with Python:
```sh
python3 -m pip install pipx
```
or with:
```sh
brew install pipx
```
````

````{tab-item} Debian-Ubuntu-Mint
```sh
python3 -m pip install pipx --break-system-packages
```
````
`````

Finalize the installation by running:

`````{tab-set}

````{tab-item} Windows
```sh
py -m pipx ensurepath
```
````

````{tab-item} macOS
```sh
python3 -m pipx ensurepath --prepend
```
````

````{tab-item} Debian-Ubuntu-Mint
```sh
python3 -m pipx ensurepath --prepend
```
````
`````

## Install and setup Mercurial

We explain [here](../mercurial/install-setup.md) how to use Pipx to install Mercurial.

## Install and setup xonsh

```sh
# a shell much user friendly that bash
pipx install 'xonsh[full]'
pipx inject xonsh xontrib-vox xontrib-argcomplete
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
pipx install formattex
pipx install formatbibtex
#
pipx install argcomplete
activate-global-python-argcomplete
```

[pipx]: https://pipx.pypa.io
