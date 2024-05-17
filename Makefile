
sync:
	pdm sync --clean

lock:
	pdm lock

build:
	pdm run build

format:
	mdformat *.md book/*.md
