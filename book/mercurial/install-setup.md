# Install and setup Mercurial

Mercurial needs to be installed AND setup. After installation, do not forget to follow
the steps presented in the session [](#setup-mercurial).

## Install Mercurial

### With TortoiseHG (simple for Windows)

Download the installer from <https://tortoisehg.bitbucket.io/>.

### With pipx (recommended on Linux)

We present pipx and how to install it [here](../setup/setup-apps.md).

```sh
pipx install mercurial
pipx inject mercurial hg-git hg-evolve hg-fluiddyn
# potentially useful to fix ssl issues (macOS)
pipx inject mercurial certifi
pipx install hg-setup
```

### With conda (cross-platform, recommended for conda users on Windows, Linux and macOS)

On Windows, macOS and Linux, one can use `conda` (installed with
[miniforge](https://github.com/conda-forge/miniforge)) to install Mercurial with few
extensions ([hg-evolve](https://pypi.org/project/hg-evolve) and
[hg-git](https://pypi.org/project/hg-git)). On Windows, these commands have to be run in
the Anaconda Prompt. First, we need to install
[conda-app](https://pypi.org/project/conda-app) in the base conda environment:

```sh
conda activate base
pip install conda-app
```

Then, with the conda-forge channel added (`conda config --add channels conda-forge`), one
just needs to run:

```sh
conda-app install mercurial
```

**Open a new terminal** and the Mercurial command `hg` should be available.

```{note}
If you don't use TortoiseHG, you should really install the visual diff and
merge tool [Meld](https://meldmerge.org/)!
```

(setup-mercurial)=

## Setup Mercurial

You need a file `~/.hgrc` containing something like
[this file](https://foss.heptapod.net/fluiddyn/fluiddyn/-/raw/branch/default/doc/hgrc).

A decent Mercurial configuration file can be created with `hg config --edit`.
Alternatively (recommended for Fluiddyn development), one can use `hg-setup` to create
the user configuration file and initialize shell completion:

```sh
hg-setup init
```

```{warning}
You should now have a file `.hgrc` (or `mercurial.ini` on Windows) in your home directory.
```

The line starting with hggit is optional and enables the extension
[hg-git](https://pypi.org/project/hg-git). This extension is useful to work on projects
using Git, for example hosted on Github and Gitlab.

The extensions churn, shelve, rebase, absorb, evolve and topic are very useful for more
advanced users. Note that [evolve](https://www.mercurial-scm.org/doc/evolution/) and
[topic](https://www.mercurial-scm.org/doc/evolution/tutorials/topic-tutorial.html) comes
from the package [hg-evolve](https://pypi.org/project/hg-evolve).

````{warning}

We wrote a specific Mercurial extension for FluidDyn development called
[hg-fluiddyn](https://foss.heptapod.net/fluiddyn/hg-fluiddyn). All FluidDyn contributors
/ developers / maintainers should install and activate it!

With Mercurial installed with `conda-app` (as explained above), just run:

```sh
conda run -n _env_mercurial pip install hg-fluiddyn
```

and activate the extension with the line `hgfluiddyn =` in the file `~/.hgrc`.

If Mercurial has been installed with pipx, you can run:

```sh
pipx inject mercurial hg-fluiddyn
```

````

```{warning}
For development of FluidDyn packages, the evolve and topic extensions have
to be installed and activated! If they are not activated, the hg-fluiddyn extension will
warn you!
```

## Check your install

You can check that Mercurial is correctly setup with

```sh
hg version -v
hg debuginstall
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
