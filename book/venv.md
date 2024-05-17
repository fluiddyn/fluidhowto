# Create and use virtual environments

This page is about standard Python environments. Note that one can also
[create conda environment with conda/mamba/pixi](./conda-forge.md).

## With `venv`

See the official Python documentation on
[Installing using pip in virtual environments](https://packaging.python.org/en/latest/guides/installing-using-pip-and-virtual-environments/).

````{admonition} Note for LEGI

You can create a virtual environment from the LEGI Python module with something like:

```sh
module load python/3.9.2
python -m venv my_venv --system-site-packages
. my_venv/bin/activate
pip install PyFoam
```

````

## With PDM

It is useful to better control our virtual environments. A good tool to do that in 2024
is [PDM](https://pdm-project.org).
