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

You need a file `~/.hgrc` containing something like
[this file](https://foss.heptapod.net/fluiddyn/fluiddyn/-/raw/branch/default/doc/hgrc).
It can be downloaded with:

```sh
wget https://foss.heptapod.net/fluiddyn/fluiddyn/-/raw/branch/default/doc/hgrc -O ~/.hgrc
```

````{admonition} Command wget not found?
---
class: dropdown
---
You might be more lucky with the equivalent command with `curl`:

```bash
curl -L https://foss.heptapod.net/fluiddyn/fluiddyn/-/raw/branch/default/doc/hgrc -o ~/.hgrc
```
````

```{warning}
You should now have a file `~/.hgrc` in your home directory.
**Modify it as explained in the file** (change the username and the email address).
```

You can check that Mercurial is correctly setup with

```sh
hg version -v
```

When everything is fine, you should be able to clone Git repos with something like:

```sh
hg clone https://gricad-gitlab.univ-grenoble-alpes.fr/legi/soft/trokata/softsync-python-debian11.git
```

or, alternatively and better, but you need to setup a SSH key on
<https://gricad-gitlab.univ-grenoble-alpes.fr/-/user_settings/ssh_keys> (take time to do
this since it is really useful!).

```sh
hg clone git@gricad-gitlab.univ-grenoble-alpes.fr:legi/soft/trokata/softsync-python-debian11.git
```

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
