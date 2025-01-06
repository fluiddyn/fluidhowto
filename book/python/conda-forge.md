# Miniforge: conda, mamba and conda-forge

In this chapter, we give indications about how to install Miniforge and use conda/mamba.
Please, if you encounter problems, fill an issue
[here](https://foss.heptapod.net/fluiddyn/fluidhowto/issues) to explain what you did and
what are the errors (please copy / paste the error log).

The first step is to install [Miniforge], which is a modified version of
[Miniconda](https://docs.conda.io/en/latest/miniconda.html) using by default the
community driven [conda-forge] channel.

`````{tab-set}

````{tab-item} Windows
On Windows, download
[the Windows installer](https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-Windows-x86_64.exe)
and follow the instructions given in https://github.com/conda-forge/miniforge.
Do not forget to
[manually](https://learn.microsoft.com/en-us/previous-versions/office/developer/sharepoint-2010/ee537574(v=office.14)#to-add-a-path-to-the-path-environment-variable)
add the `C:\Users\myusername\miniforge3\condabin` folder to the path environment variable.
````

````{tab-item} Unix (Linux and macOS)

Download the installer using curl or wget or your favorite program. For eg:

```sh
wget "https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-$(uname)-$(uname -m).sh"
```

or

```sh
curl -L -O "https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-$(uname)-$(uname -m).sh"
```

Execute the installer and initialize conda:

```sh
bash Miniforge3-$(uname)-$(uname -m).sh -b
$HOME/miniforge3/bin/conda init --all
```
````

`````

When it's done, open a new terminal (click on `ctrl-alt-t`) and check that the line in
the new terminal starts with `(base)`. The indication `(base)` means that you use the
base "environment".

However, working in the `base` environment is not a good practice and it is better to
disable the auto activation with:

```sh
conda config --set auto_activate_base false
```

`conda` and `mamba` are 2 commandline tools to manage software installations and create
"environments".

```{margin}
**`conda` and `mamba`: differences?**

Conda is an open source package management system and environment management
system that runs on Windows, macOS and Linux.

Mamba is a new implementation of conda, which can be faster for some operations.
However, modern `conda` now uses internally some parts of `mamba`,
so one can just use the `conda` command line.
```

```{admonition} Definition: environment
A environment is a set of programs and libraries with particular versions. An
environment is defined by the software installed on your computer and by
environment variables, in particular the variable `$PATH`, which contains all
the paths where your shell looks for programs (you can read the output of `echo
$PATH`).
```

It is very useful to be able to create different environments for different tasks. It is
usually better to keep the `base` environment only for the `conda` software and to use
different environments for other tasks. We will use this strategy here. We will have

- 1 environment for some basic libraries used in this course (called `main`),

- 1 environment with Mercurial (automatically created with the tool `conda-app`)

- 1 environment with Fluidsim and MPI (called `env-fluidsim-mpi`)

`conda` takes the programs that it installs from "channels". We are going to use the
largest open-source community driven channel called [conda-forge]. With [Miniforge],
[conda-forge] is by default the main channel.

We can start by creating the `main` environment with the commands:

```bash
conda env create --file https://foss.heptapod.net/fluiddyn/fluidhowto/-/raw/main/conda-envs/env-main.yml
```

While `conda` creates the environment, we can study the most important conda commands:

- `conda activate main`

- `conda deactivate`

- `conda search fluidsim`

- `conda create -n name-env numpy pandas`

- `conda env list`

```{tip}

One can add the line `conda activate main` at the end of the file `~/.bashrc`.

```

(install-setup-mercurial)=

## Install and setup Mercurial

To install Mercurial, you can do:

```bash
conda activate base
pip install conda-app -U
conda-app install mercurial
```

Close the terminal (`ctrl-d`) and reopen a new terminal (`ctrl-alt-t`)! The commands `hg`
and `hg-setup` should be available. However, you still **have to** finalize Mercurial
setup, which can be done by running:

```sh
hg-setup init
```

```{warning}
Mercurial **has to be correctly setup**! Since we will Github and Gitlab, the Mercurial
extension hg-git has to be activated so the line `hggit =` in the configuration
file `~/.hgrc` is mandatory. However, hg-setup should have set this for you.

You can check that everything is right by running `hg version -v`.
```

[conda-forge]: https://conda-forge.org/
[miniforge]: https://github.com/conda-forge/miniforge
