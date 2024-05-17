# Setup useful aliases

This is very useful to create few aliases, which can be done by adding in the file
`~/.bash_aliases` lines like these ones:

```sh
alias sshcl1f001='ssh -X cl1f001'
alias sshnrj1sv224='ssh -X nrj1sv224'
alias sshnrj1sv223='ssh -X nrj1sv223'
```

On the LEGI cluster, one can also have:

```sh
alias oarsub-inter2cores='oarsub -I -l /core=2'
alias oarsub-inter4cores='oarsub -I -l /core=4'
alias oarsub-inter8cores='oarsub -I -l /core=8'
```
