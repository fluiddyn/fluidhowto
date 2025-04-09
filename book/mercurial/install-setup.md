# Install and setup Mercurial

```{margin} Modern Mercurial

[Mercurial] is a versioning tool like Git (same generation and similar theoretical
bases). For very simple things, it is quite similar to Git. However, there are also
important differences.

Github and Gitlab do not support Mercurial. Git became for open-source THE tool used for
versioning all kinds of projects.

However, Mercurial has been used in companies of all sizes for years and grew up as
a great tool, with advantages compared to Git, in particular in terms of simple user
interface, safety (no force push needed, no destructive history edition), performance for
big repositories (with a growing part written in Rust) and collaborative history edition
(with this Mercurial extensions [evolve] and [topic]).

```

In this page, we discuss how to install and setup **modern [Mercurial] using the [topic],
[evolve] and [hg-git] extensions**. General Mercurial installation instructions are given
here https://www.mercurial-scm.org/install, however, unless you really know what you're
doing, **I strongly suggest that you just follow the following instructions**.

```{important}

It is really easy with other installation methods to get a broken installation
without the topic, evolve and hg-git extensions and **you need them to contribute** to
projects using modern Mercurial and to projects hosted on Github and Gitlab instances.

Installing with old tools like `conda` or `pip` is possible but really not a good
idea for Mercurial.

```

Since Mercurial is a Python application, recent versions can be installed with tools like
[UV], [Pipx] or [Pixi]. However, for Windows it is still better to just install
TortoiseHG as presented below.

```{warning}
These instructions suppose that you have [UV] or [Pipx] installed.
If these tools do not work correctly, see [](/setup/setup-apps.md).
```

- Preliminary: visual diff and merge tools

  If you don't use TortoiseHG, you should really install a visual diff and merge tool,
  for example [Meld](https://meldmerge.org/).

  `````{tab-set}

  ````{tab-item} Windows
  Download and execute the installer here: https://meldmerge.org/
  ````

  ````{tab-item} macOS
  Install [dehesselle-meld](https://formulae.brew.sh/cask/dehesselle-meld) with:
  ```sh
  brew install --cask dehesselle-meld
  ```
  ````

  ````{tab-item} Debian-Ubuntu-Mint
  ```sh
  sudo apt install meld
  ```
  ````
  `````

- Install Mercurial and its extensions

  `````{tab-set}

  ````{tab-item} Windows ➜ TortoiseHG
  TortoiseHg, Mercurial and few important extensions can be installed with
  [Winget](https://learn.microsoft.com/en-us/windows/package-manager/winget/):

  ```powershell
  winget install TortoiseHg.TortoiseHg -e --accept-package-agreements
  ```

  Alternatively, one can
  [download an installer](https://www.mercurial-scm.org/release/tortoisehg/windows/)
  and run it to install TortoiseHG.
  ````

  ````{tab-item} UV
  ```sh
  uv tool install mercurial --with hg-git --with hg-evolve
  ```
  On macOS, it can be useful to also add `--with certifi`
  ````

  ````{tab-item} Pipx
  ```sh
  pipx install mercurial
  pipx inject mercurial hg-git hg-evolve
  ```
  Potentially useful to fix ssl issues (macOS)
  ```sh
  pipx inject mercurial certifi
  ```
  ````

  ````{tab-item} Pixi
  ```sh
  pixi global install mercurial --with hg-git --with hg-evolve
  ```
  On macOS, it can be useful to also add `--with certifi`
  ````

  `````

- Check that `hg` corresponds to the Mercurial installed with UV/Pipx/Pixi

  ```sh
  hg debuginstall
  ```

  ```{dropdown} Not using the right hg?
  The simplest solution is to uninstall the old Mercurial installed with another method.

  Alternatively, the directory where UV/Pipx/Pixi puts the executables has to be before other
  directories where older Mercurial can be present so that `hg` really corresponds to the
  Mercurial install with UV/Pipx/Pixi. You can check the environment variable `$PATH`. See
  [](/setup/setup-apps.md).
  ```

- Setup Mercurial (config file `~/.hgrc` and completion)

  You need a file `~/.hgrc` containing something like
  [this file](https://foss.heptapod.net/fluiddyn/fluiddyn/-/raw/branch/default/doc/hgrc).
  A decent Mercurial configuration file can be created with `hg config --edit`.
  Alternatively (recommended for beginners), one can use `hg-setup` to create the user
  configuration file and initialize shell completion:

  `````{tab-set}
  ````{tab-item} UV
  ```sh
  uvx hg-setup init
  ```
  or (if you get an error)
  ```sh
  uv tool install hg-setup
  hg-setup init
  ```
  ````

  ````{tab-item} pipx
  ```sh
  pipx run hg-setup init
  ```
  ````
  `````

  Complete information, save the config file and quit `hg-setup`

```{margin}
You should now have a file `.hgrc` (or `mercurial.ini` on Windows) in your home directory.

The line starting with `hggit` is optional and enables the extension
[hg-git](https://pypi.org/project/hg-git). This extension is useful to work on projects
using Git, for example hosted on Github and Gitlab.

The extensions churn, shelve, rebase, absorb, evolve and topic are very useful for more
advanced users. Note that [evolve] and
[topic] comes
from the package [hg-evolve](https://pypi.org/project/hg-evolve).
```

- Check that everything is fine. **Are evolve, topic and hggit extensions indeed
  enabled?**

  ```sh
  hg version -v
  ```

  ```{important}

  If evolve, topic and hggit are not mentioned in the output of `hg version -v`,
  there is a problem that needs to be fixed.

  ```

  If everything is fine, you should be able to get some help provided by the extensions.
  Check it (press on `q` to quit the help screen)!

  ```sh
  hg help evolve
  hg help topic
  hg help hggit
  ```

  When everything is fine, you should be able to clone Mercurial repos with something
  like

  ```sh
  hg clone https://foss.heptapod.net/fluiddyn/fluidhowto
  ```

  You should also be able to clone Git repos with something like:

  ```sh
  hg clone https://github.com/paugier/nbabel.git
  ```

  or, alternatively and better, but you need to
  [setup a SSH key on Github](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)
  (take time to do this since it is really useful!):

  ```sh
  hg clone git@github.com:paugier/nbabel.git
  ```

  ```{note}
  It is fine to use the same SSH key for other applications, for example Gitlab or
  Heptapod instances. You only share the public key.
  ```

[evolve]: https://www.mercurial-scm.org/doc/evolution/
[hg-git]: https://foss.heptapod.net/mercurial/hg-git
[mercurial]: https://www.mercurial-scm.org
[pipx]: https://pipx.pypa.io
[pixi]: https://pixi.sh
[topic]: https://www.mercurial-scm.org/doc/evolution/tutorials/topic-tutorial.html
[uv]: https://docs.astral.sh/uv/
