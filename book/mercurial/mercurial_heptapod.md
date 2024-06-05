# Mercurial very short tutorial for FluidDyn

## Get help

To get help on Mercurial, one can start with:

```sh
hg help
```

or for a specific command (here `clone`):

```sh
hg help clone
```

## Simple workflow

To make a copy of an existing repository:

```sh
hg clone https://foss.heptapod.net/fluiddyn/fluiddyn
```

To get a summary of the working directory state:

```sh
hg summary
```

or just `hg sum`.

To show changed files in the working directory:

```sh
hg status
```

or just `hg st`.

If you add new files or if you deleted files:

```sh
hg add name_of_the_file

hg remove name_of_the_file
```

This command is also very usefull:

```sh
hg addre
```

Each time you did some consistent changes:

```sh
hg commit
```

or:

```sh
hg commit -m "A message explaining the commit"
```

I would advice to run after a commit command `hg st` to check that you did what you
wanted to do. If you are unhappy with the commit, you can amend it with another commit
with:

```sh
hg amend
```

To push the state of your working repository to your repository on the web:

```sh
hg push
```

The inverse command (pull all commits from the remote repository) is:

```sh
hg pull
```

### Get the last version of a code

First pull all the changesets from the remote repository:

```sh
hg pull
```

Then update the code to the tip:

```sh
hg update
```

or just `hg up`. You can also directly do:

```sh
hg pull -u
```

### Read the history

You can get a list of the changesets with:

```sh
hg log --graph
```

or just `hg log -G`. With the `--graph` or `-G` option, the revisions are shown as an
ASCII art.

### Update the code to an old revision

Use `hg up 220` to update to the revision 220. We can use a tag, bookmark, topic name or
branch name instead of a number. To get a clean copy, add the option `-C` (beware).

### Create a repository from a directory

Create a new repository in the given directory by doing:

```sh
hg init
```
