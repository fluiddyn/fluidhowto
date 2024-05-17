# Fluiddyn Howto Book

This is a small introduction on how to use Python at LEGI. We first focus on what can be
done on the machines running Debian and in particular Debian 11 (Bullseye), which is the
version used in summer 2024 on the LEGI clusters.

```{admonition} Note for LEGI

It is common when using this website to copy commands from this site and to paste them in
a terminal. Copy/pasting connection does not always work well with x2go (the remote desktop
software used to connect to the LEGI cluster). Therefore, if you need to copy/paste commands,
we advice to open this website from a browser launched in the x2go session. Alternatively,
one can just open a local terminal and connect to the cluster with a simple ssh command.

```

On Linux, it is often reasonable to use the Python provided by the system
(`/usr/bin/python3`). On Debian 11, `python3` corresponds to Python 3.9.2, which is still
in 2024 a good version to be used for developing and computing.

```{note}

Yes, Python 3.9 is a bit outdated in 2024. The LEGI cluster is running on Debian 11
which is nowadays the "old stable" version. The cluster will soon be updated to Debian 12
(nowadays "Debian stable"), which comes with Python 3.11. In case you need a newer Python
version or other implementations (like PyPy), you can install them with Conda/Mamba/Pixi
(see [our documentation on conda-forge](./conda-forge.md)) or with
[pyenv](https://github.com/pyenv/pyenv).

```

One of the most simple way to use Python at LEGI is to activate (for example with
`module load python/3.9.2`) the big "read-only" virtual environment created with the
repository
[softsync-python-debian11](https://gricad-gitlab.univ-grenoble-alpes.fr/legi/soft/trokata/softsync-python-debian11).
This possibility is described in detailed [here](./modules.md).

At LEGI, the Debian package `python3-venv` is installed so one can create virtual
environments as explained [here](./venv.md).

The Debian package `python3-pip` is also installed so one can install packages seen by
the system packages (in `~/.local/lib/python3.9`). However, for most tasks, this practice
is not recommended. We will only use this possibility to install
[pipx](https://github.com/pypa/pipx), which can be used to
[install useful applications](./setup-apps.md).

## Table of contents

```{tableofcontents}
```
