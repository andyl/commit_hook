# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

CommitHook is an Elixir Mix project providing CLI tasks to manage Git commit-msg hooks that enforce Conventional Commits format validation. It copies/renames a bash hook script (`priv/commit-msg`) into `.git/hooks/`.

## Common Commands

```bash
mix deps.get                 # Fetch dependencies
mix compile                  # Compile
mix test                     # Run all tests
mix test test/path_test.exs  # Run a single test file
mix format                   # Format code
mix format --check-formatted # Check formatting
```

## Architecture

Three Mix tasks manipulate `.git/hooks/commit-msg`:

- **`mix commit_hook.install`** — Hidden task. Removes `.git/hooks/commit-msg.sample`, copies `priv/commit-msg` to `.git/hooks/commit-msg`, makes it executable.
- **`mix commit_hook.enable`** — Public task. If `.git/hooks/commit-msg.disable` exists, renames it back; otherwise does a fresh install. Should appear in `mix help`.
- **`mix commit_hook.disable`** — Public task. Renames `.git/hooks/commit-msg` to `.git/hooks/commit-msg.disable`. Should appear in `mix help`.

Task implementations live in `lib/mix/tasks/`. The specification for each task is in `instructions.md`.

## Key Dependencies

- **igniter** (~> 0.6) — Code generation and installation framework. Enables `mix igniter.install commit_hook`.
- **git_ops** (~> 2.0) — Release management with Conventional Commits. Configured in `config/config.exs`.

## Conventions

- **All commits must use Conventional Commits format**: `<type>[optional scope]: <description>`. Allowed types: feat, fix, chore, docs, test, style, refactor, perf, build, ci, revert.
- Commit subject lines must be ≤100 characters.
