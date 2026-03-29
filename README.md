# CommitHook

Mix tasks to enable/disable lint checks for Conventional Commit (CC) messages.

Learn more about [Git Hooks](https://git-scm.com/book/en/v2/Customizing-Git-Git-Hooks) 
and [Conventional Commit](https://git-scm.com/book/en/v2/Customizing-Git-Git-Hooks)
messages.  

Conventional Commit messages are essential for automated release management
with tools like [GitOps](https://github.com/zachdaniel/git_ops).

## Installation 

### Manual Installation 

The package can be installed in your project by adding `commit_hook` to your
list of dependencies in `mix.exs`.  This is useful if you would like the
developers who clone your repo to use the CommitHook.

```elixir
def deps do
  [
    {:commit_hook, "~> 0.5.1"}
  ]
end
```

After running `mix deps.get`, you should run `mix commit_hook.enable`.

### Installing the Archive 

You can also install CommitHook globally as an Elixir Archive:

`mix archive.install hex commit_hook`

## Usage 

```
> mix commit_hook.enable    # enable the commit hook 
> mix commit_hook.disable   # disable the commit hook 
> mix commit_hook.info      # show valid CC fields
```

## Cloning Your Repo 

Every developer who clones your repo will have to explicitly install the commit
hook locally.  Your commit hook settings can not be saved in your repo. This is
an intentional design of the Git Hook system, intended to address security
risks.

You may wish to add a note for developers in your README file:

```
## Git Hooks

We enforce Conventional Commit messages locally so the repo stays clean.

Learn more at [https://www.conventionalcommits.org](https://www.conventionalcommits.org).

After cloning, install the hook. Run once:

    > mix commit_hook.install

```

## Related Tools 

CommitHook is intended to be a very simple Elixir tool to add a CC lint check
to your repo.  There are other Elixir tools that configure commit hooks:

- [GitOps](https://github.com/zachdaniel/git_ops) - a tool for managing Elixir
  releases.  It also contains a function to manage CC Commit Hook.

- [GitHooks](https://github.com/qgadrian/elixir_git_hooks) - a general purpose
  tool that handles Git Hooks for many use cases.

- There are many online guides on how to setup Conventional Commit checks in
  CI/CD.  Here are a couple:
  <https://github.com/marketplace/actions/conventional-commit-in-pull-requests>
  <https://capgo.app/blog/automating-ci-cd-with-conventional-commits/> 

