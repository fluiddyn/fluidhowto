# Setup computing and development environments with `conda`

To study scientific problems with computers, one needs to compute and to develop code. It
is good to know enough about how to install software and libraries to be relatively
independent of the computers that you are going to use. Here, we will learn some methods
to install programs that will be useful in general and in particular for this course.

We will use Python 3 (with Miniconda3), a good Python IDE (either Spyder or VSCode),
Jupyter and a version-control tool (Mercurial, or Git if you know it and really like it).

In the following, we give indications about how to install these tools and how to get the
repository of this training locally on your computer. Please, if you encounter problems,
fill an issue
[here](https://gricad-gitlab.univ-grenoble-alpes.fr/python-uga/py-training-2023/issues)
to explain what you did and what are the errors (please copy / paste the error log). It
is also a good exercice to learn how to open an issue in an issue tracker and how to
interact to find a solution to your problem.

Moreover, let's add that the best OS for High Performance Computing (and HPC with Python)
is Linux/GNU. Windows (at least without
[WLS](https://en.wikipedia.org/wiki/Windows_Subsystem_for_Linux)) and even macOS are less
adapted for this particular application. Python is a cross-platform language but
nevertheless, you will get a better experience for HPC with Python on Linux. Moreover,
all large HPC clusters are running on Linux.

## Install Mambaforge and Python

The first step is to install [Mambaforge], which is a modified version of
[Miniconda](https://docs.conda.io/en/latest/miniconda.html) with the new and fast
cross-platform package manager [mamba](https://github.com/mamba-org/mamba) and using by
default the community driven [conda-forge] channel.

```bash
wget "https://github.com/conda-forge/miniforge/releases/latest/download/Mambaforge-$(uname)-$(uname -m).sh" -O Mambaforge_installer.sh
bash Mambaforge_installer.sh -b
$HOME/mambaforge/bin/mamba init bash
```

When it's done, try to open a new terminal (click on `ctrl-alt-t`) and check that the
line in the new terminal starts with `(base)`. If yes, you can close the old terminal
(with `ctrl-d`). The indication `(base)` means that you use the base "environment".

`conda` and `mamba` are 2 commandline tools to manage software installations and create
"environments".

```{margin}
**`conda` and `mamba`: differences?**

Conda is an open source package management system and environment management
system that runs on Windows, macOS, Linux and z/OS.

Mamba is a new implementation of conda, which is faster for some operations and
has better logging.
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

- 1 environment with the Spyder editor (automatically created with the tool `conda-app`)

- 1 environment with Mercurial (automatically created with the tool `conda-app`)

`conda` takes the programs that it installs from "channels". We are going to use the
largest open-source community driven channel called [conda-forge]. With [Mambaforge],
[conda-forge] is by default the main channel.

We can start by creating the `main` environment with the commands:

```bash
# download a requirement file
wget https://gricad-gitlab.univ-grenoble-alpes.fr/python-uga/py-training-2023/-/raw/main/main_environment.yml
# install with conda
mamba env create -f main_environment.yml
```

While `mamba` creates the environment, we can study the most important conda commands:

- `conda activate main`

- `conda deactivate`

- `mamba search fluidsim`

- `mamba create -n name_env numpy pandas`

- `mamba env list`

## Install and setup Mercurial

To install Mercurial, you can do:

```bash
pip install conda-app
conda-app install mercurial
```

```{note}
The `conda-app install` command can take some time, especially if many students
run it at the same time in the same computer room.
```

Close the terminal (`ctrl-d`) and reopen a new terminal (`ctrl-alt-t`)! Then, you can
open the Mercurial configuration file with:

```bash
gedit ~/.hgrc &
```

````{margin}

```{admonition} Why the & at the end of this command?

The `&` makes the command run in the background, so that you can continue to
use this terminal while `gedit` is running.

From man bash:

> If a command is terminated by the control operator &, the shell executes the
> command in the background in a subshell. The shell does not wait for the
> command to finish, and the return status is 0.
```
````

You have to modify it to get something like this:

```
[ui]
username=myusername <email@adress.org>
editor=nano
tweakdefaults = True

[extensions]
hgext.extdiff =
# only to use Mercurial with GitHub and Gitlab
hggit =

[extdiff]
cmd.meld =
```

```{warning}
Mercurial **has to be correctly setup**! Since we will use [the Gitlab
instance of UGA](https://gricad-gitlab.univ-grenoble-alpes.fr), the Mercurial
extension hg-git has to be activated so the line `hggit =` in the configuration
file is mandatory.

You can check that everything is right with `hg version -v`.
```

## Clone this repository

Once everything is installed and set up, you should be able to clone the repository of
the training with:

```bash
hg clone https://gricad-gitlab.univ-grenoble-alpes.fr/python-uga/py-training-2023.git
```

Please
[tell us](https://gricad-gitlab.univ-grenoble-alpes.fr/python-uga/py-training-2023/issues)
if it does not work.

Once the repository is cloned you should have a new directory `py-training-2023` (launch
the command `ls` to see it) and you should be able to enter into it with
`cd py-training-2023`.

## Build the website of this course

The source of the
[website of this course](https://python-uga.gricad-pages.univ-grenoble-alpes.fr/py-training-2023/intro.html)
is in the repository and you can build the website to read it offline. Just run `make`
from the root directory (with the `main` environment).

## Install the Python IDE Spyder

[Spyder] is a free and open source scientific environment written in Python, for Python,
and designed by and for scientists, engineers and data analysts.

To install Spyder, you can do:

```bash
conda-app install spyder
```

After opening a new terminal, you should be able to launch Spyder by running `spyder &`.
Configure the conda environment you want to work with. For now, it should be the `main`
environment and the path towards the Python executable should be
`$HOME/mambaforge/envs/main/bin/python`.

[conda-forge]: https://conda-forge.org/
[mambaforge]: https://github.com/conda-forge/miniforge
[spyder]: https://www.spyder-ide.org/
