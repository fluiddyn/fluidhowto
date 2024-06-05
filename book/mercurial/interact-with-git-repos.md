# Interact with a Git repos (on Github/Gilab) with hggit

To clone a git repository:

```sh
hg clone git+ssh://git@github.com/serge-sans-paille/pythran.git
```

or just:

```sh
hg clone https://github.com/serge-sans-paille/pythran.git
```

Git branches are represented as Mercurial bookmarks so such commands can be useful:

```sh
hg log --graph

hg up master

hg help bookmarks

# list the bookmarks
hg bookmarks

# put the bookmark master where you are
hg book master

# deactivate the active bookmark (-i like --inactive)
hg book -i
```

```{note}
`bookmarks`, `bookmark` and `book` correspond to the same mercurial command.
```

```{warning}
If a bookmark is active, `hg pull -u` or `hg up` will move the bookmark to
the tip of the active branch. You may not want that so it is important to always
deactivate an unused bookmark with `hg book -i` or with `hg up master`.
```

Do not forget to place the bookmark `master` as wanted.

## A quite complicated example with hg-git

We open a PR:

```sh
hg pull
hg up master
hg book fix/a_bug
# Modify/add/remove files
hg commit -m "A commit message"
hg push -r .
```

We want to change something in the commit of the PR. We first try `hg absorb`. Let's say
that we are in a situation for which it does not work:

```sh
# Modify/add/remove files
hg commit -m "A different commit message" --amend
# clean up Git commit map after history editing
hg git-cleanup
hg pull
hg push -r . --force
```

## Delete a bookmark in a remote repository (close a remote Git branch)

With Mercurial,
[we can do](https://stackoverflow.com/questions/6825355/how-do-i-delete-a-remote-bookmark-in-mercurial):

```sh
hg bookmark --delete <bookmark name>
hg push --bookmark <bookmark name>
```

Unfortunately, it does not work for a remote Git repository (with hg-git). We have to use
a Git client, clone the repository with Git and do
[something like](https://stackoverflow.com/a/10999165/1779806):

```sh
# this deletes the branch locally
git branch --delete <branch name>
# this deletes the branch in the remote repository
git push origin --delete <branch name>
```
