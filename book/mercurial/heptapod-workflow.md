# Heptapod workflow based on Merge request and the topic/evolve extensions

We now use a Merge-Request (MR) based workflow for the development of FluidDyn packages.

```{note}
GitLab's "merge requests" are equivalent to GitHub's "pull requests".
```

```{note}
In contrast to the standard workflow in Github and Gitlab, you don't need to
fork the repository to create Merge Requests.
```

Instead, you need to become a "developer" of the project. The developers have the
permission to push changesets (i.e. "commits") in a topic in the main repository (for
example <https://foss.heptapod.net/fluiddyn/fluidsim>). To acquire the "developer" role,
please send a message in an [issue] or if needed, create a dedicated issue.

Topics are used in Mercurial for "lightweight branches" (like Git branches). If you are
unfamiliar with Mercurial topics, you can read
[this tutorial](https://www.mercurial-scm.org/doc/evolution/tutorials/topic-tutorial.html),
but what follows should be sufficient for FluidDyn development. The principle is that you
first create a topic (with `hg topic name_of_my_topic`). Once a topic is activated, the
changesets created belong to this topic. The new changesets gathered in a topic can be
pushed into the main repository. Even after having been pushed into the main repository,
they stay in the `draft` phase (which means they can be modified, as opposed to `public`
changesets. Run `hg help phases` for more info).

To list the topics:

```sh
hg topics
```

To activate a topic already created:

```sh
hg up the_name_of_the_topic
```

To deactivate the topic and come back to the tip of the default branch:

```sh
hg up default
```

To get the list of the changesets in the active topic (very useful):

```sh
hg stack
```

Developers have to create Merge Requests to get things merged in the targeted branch
(which is usually default for FluidDyn packages). Let's present an example. A FluidDyn
developer can do (here, we use ssh but you can also use https):

```sh
hg clone ssh://hg@foss.heptapod.net/fluiddyn/fluidsim
hg topic fix_something
hg commit -m "Fix a bug related to ..."
hg push
```

Mercurial is going to print an URL to create the associated MR. Once created, the MR
should then be reviewed by a "maintainer". Only maintainers have the right to merge a MR,
i.e. to publish changesets. The maintainer can tell you how to modify your MR and s-he
can also directly modify the changesets of the MR!

We strongly advice to install and activate the
[evolve](https://www.mercurial-scm.org/doc/evolution/), rebase and
[absorb](https://gregoryszorc.com/blog/2018/11/05/absorbing-commit-changes-in-mercurial-4.8/)
extensions locally (see the example of `.hgrc` above). This gives a very nice user
experience for the MRs, with the ability to modify a MR with `hg absorb` and safe history
editing.

````{tip}
`hg absorb` is very useful during code review. Let say that a developer
submitted a PR containing few commits. As explained in
[this blog post](https://gregoryszorc.com/blog/2018/11/05/absorbing-commit-changes-in-mercurial-4.8/),
`hg absorb` is a mechanism to automatically and intelligently incorporate uncommitted
changes into prior commits. Edit the files to take into account the remarks of the code
review and just run:

```
hg absorb
hg push
```

and the PR is updated!
````

````{tip}

If you are asked to "rebase" your MR, it should work with the following
commands:

```
hg pull
hg up name_of_my_topic
hg rebase
hg push
```

````

[issue]: https://foss.heptapod.net/fluiddyn/fluiddyn/issues/6
