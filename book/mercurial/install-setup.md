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

In this page, we discuss how to install and setup **modern [Mercurial] using the [topic]
and [evolve] extensions**. General Mercurial installation instructions are given here
https://www.mercurial-scm.org/install, however, except if you really know what you do,
**I strongly suggest that you just follow the following instructions**.

```{important}

It is really easy with other installation methods to get a broken installation
without the topic, evolve and hg-git extensions and **you need them to contribute** to
some projects.

```

Since Mercurial is a Python application, recent versions can be installed with tools like
[UV], [Pipx] or [Pixi]. However, for Windows it is still better to just
[download and install TortoiseHG](https://www.mercurial-scm.org/release/tortoisehg/windows/).

```{warning}
These instructions suppose that you have [UV] or [Pipx] installed.
```

- Preliminary: visual diff and merge tools

  If you don't use TortoiseHG, you should really install a visual diff and merge tool,
  for example [Meld](https://meldmerge.org/) (for macOS,
  [dehesselle-meld](https://formulae.brew.sh/cask/dehesselle-meld)).

- Install Mercurial and its extensions

  `````{tab-set}

  ````{tab-item} Windows ➜ TortoiseHG
  [Download the installer](https://www.mercurial-scm.org/release/tortoisehg/windows/) and run
  it to install TortoiseHG.
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
  Importantly, the directory where UV/Pipx/Pixi puts the executables has to be before other
  directories where older Mercurial can be present so that `hg` really corresponds to the
  Mercurial install with UV/Pipx/Pixi. You can check the environment variable `$PATH`.
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

  If everything is fine, you should be able to get some helps provided by the extensions.
  Check it!

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

  or, alternatively and better, but you need to setup a SSH key on Github (take time to
  do this since it is really useful!):

  ```sh
  hg clone git@github.com:paugier/nbabel.git
  ```

[evolve]: https://www.mercurial-scm.org/doc/evolution/
[mercurial]: https://www.mercurial-scm.org
[pipx]: https://pipx.pypa.io
[pixi]: https://pixi.sh
[topic]: https://www.mercurial-scm.org/doc/evolution/tutorials/topic-tutorial.html
[uv]: https://docs.astral.sh/uv/
