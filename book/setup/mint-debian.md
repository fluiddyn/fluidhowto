# Setup LMDE 6

LMDE is a Linux Mint project which stands for "Linux Mint Debian Edition".
[LMDE 6](https://www.linuxmint.com/rel_faye.php) is based on Debian 12 Bookworm.

0. Update as suggested by the helper application and installed what is suggested (for
   example codex)

1. Setup synchronization with Firefox account

2. Install few Debian packages with `apt`, something like:

```sh
sudo apt install \
  clang gfortran cmake \
  python3-pip \
  libpng-dev libfftw3-dev libfftw3-mpi-dev \
  libhdf5-dev libopenmpi-dev \
  libopenblas-dev \
  curl ack meld pandoc \
  fish zsh \
  nextcloud-desktop nautilus-nextcloud \
  git emacs
```

03. Setup cloud data (for example https://sdrive.cnrs.fr which uses Nextcloud)

04. [Install editors](./editors.md), in particular VSCode + setup synchronization with
    Github account

05. [Setup Bash aliases](./aliases.md)

06. [Install pipx and few applications available on PyPI](./setup-apps.md)

07. [Install Miniforge](../python/conda-forge.md)

08. Install [UV] and [Pixi]

09. [Create a ssh key](https://foss.heptapod.net/help/user/ssh.md) and copy the public
    key on Github, Gitlab, foss.heptapod.net

10. Install Rust tools

11. Install Docker

12. Install Mojo/Magic

[pixi]: https://pixi.sh/dev/
[uv]: https://docs.astral.sh/uv/getting-started/installation/
