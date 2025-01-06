build:
	pdm run build

sync:
	pdm sync --clean
	pdm run python -m bash_kernel.install

lock:
	pdm lock

clean:
	rm -rf book/_build

cleanall: clean
	rm -rf .venv

format:
	mdformat *.md book/*.md
