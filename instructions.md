# CommitHook Coding Instructions 

The intent of the CommitHook repo is described in the README.md file.

The application logic is captured in three Mix tasks:

1. mix commit_hook.install - Automatically called by 'igniter.install'
2. mix commit_hook.enable - Enable the Commit Hook 
3. mix commit_hook.disable - Disable the Commit Hook 

Detailed Instructions:

**mix commit_hook.install** 

- removes the file `.git/hooks/commit-msg.sample` if it exists 
- copies the file `priv/commit-msg` to `.git/hooks/commit-msg` 
- makes the file `.git/hooks/commit-msg` executable
- this task should not appear in the `mix help` list

**mix commit_hook.enable** 

- if the file `.git/hooks/commit-msg.disable` exists, rename it to
  `.git/hooks/commit-msg`, else copy the file `priv/commit-msg` to
  `.git/hooks/commit-msg` and make it executable.
- include `mix help` documentation for this task 
 
**mix commit_hook.disable** 

- if the file `.git/hooks/commit-msg` exists, rename it to `.git/hooks/commit-msg.disable`
- include `mix help` documentation for this task 

