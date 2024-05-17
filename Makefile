
sync:
	pdm sync --clean
	pdm run build

lock:
	pdm lock

build:
	pdm run build

clean:
	rm -rf book/_build

format:
	mdformat *.md book/*.md
