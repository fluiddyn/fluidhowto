# LEGI Python module

We consider here the module based on the system Python 3 provided by Debian
(`/usr/bin/python3`). The exact version depends on the Debian version (3.9.2 for Debian
11 and 3.11.2 for Debian 12).

This module is a "read-only" virtual environment based on `/usr/bin/python3` containing a
selection of packages useful for fluid mechanics. The module is updated when needed so
that the packages are up-to-date. The module is tested for simple things (like using
Numpy, Pandas, Matplotlib as they should be used in 2024), so these simple things should
always work. If one needs more stability, one should use [other tools](../python.md).

These virtual environments are created by the computer department of the lab and **cannot
be modified by the users** (`pip install ...` does not work), meaning that all users
should have the same experience. However, it is still possible to modify this module by
using the virtual environment `PYTHONPATH`, but this is not recommended.

## Activate and deactivate the module

One can use the `module` command. On Debian 11, one should do:

```sh
module load python/3.9.2
```

Deactivating the module can be done with `module unload python`.

The modules are actually real virtual environments so that one can also activate them by
sourcing the activate script

```sh
. /opt/python/3.9.2/bin/activate
```

In this case, deactivating it can be done with `deactivate`.

## Create a small virtual environment based on the Python module

You can create a small virtual environment (see [our page on virtual env](./venv.md))
from the Python module with something like:

```sh
module load python/3.9.2
python -m venv my_venv --system-site-packages
. my_venv/bin/activate
pip install PyFoam
```

## Use an older version of this module

If some scripts stopped working after an update of the module,
[please, fill an issue in this repo](https://gricad-gitlab.univ-grenoble-alpes.fr/legi/soft/trokata/softsync-python-debian11/-/issues).

However, it is simple to exactly recreate an older version of this module. First
[install the applications used for developping this module](../setup/setup-apps.md).
Then, you should be able to clone the repo with

```sh
cd ~
hg clone https://gricad-gitlab.univ-grenoble-alpes.fr/legi/soft/trokata/softsync-python-debian11
```

To recreate an old version, one should run something like

```sh
cd ~/softsync-python-debian11
# get all new commits
hg pull
# study which version you want (look at the dates)
hg lg
# update the code (in particular the lockfile) to a specific version
hg update 49
# this creates the virtual environment
make
```

The environment can then be activated with

```sh
. ~/softsync-python-debian11/.venv
```

## What if this module is not sufficient for you needs

The Python modules are defined and created with
[this repository](https://gricad-gitlab.univ-grenoble-alpes.fr/legi/soft/trokata/softsync-python-debian11).
If you encounter a problem, create an issue
[here](https://gricad-gitlab.univ-grenoble-alpes.fr/legi/soft/trokata/softsync-python-debian11/-/issues).

Note that the purpose of this module is to **simplify the use of Python for simple
cases**. There are [other tools for other needs](../python.md).

- If you need another Python application, you can try to
  [install it with pipx](../setup/setup-apps.md).

- If you need another Python library that can be useful for other people at LEGI, it can
  be included in the official Python module.
  [Please, fill an issue in this repo](https://gricad-gitlab.univ-grenoble-alpes.fr/legi/soft/trokata/softsync-python-debian11/-/issues).

- If you need another version of a Python library installed in this module, the module
  can be updated.
  [Please, fill an issue in this repo](https://gricad-gitlab.univ-grenoble-alpes.fr/legi/soft/trokata/softsync-python-debian11/-/issues).
  You can also [create a dedicated virtual environment](./venv.md).

- If you need another Python library that is not mainstream for fluid mechanics,
  [create a dedicated virtual environment](./venv.md) or
  [install it with conda-forge](./conda-forge.md).

- If you need another version of Python or another Python implementations (for example
  PyPy), you can use [conda/mamba](./conda-forge.md) or
  [pyenv](https://github.com/pyenv/pyenv).
