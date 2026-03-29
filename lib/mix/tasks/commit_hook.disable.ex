defmodule Mix.Tasks.CommitHook.Disable do
  use Mix.Task

  @shortdoc "Disable the Conventional Commits commit-msg hook"

  @moduledoc """
  Disables the Conventional Commits commit-msg Git hook.

      $ mix commit_hook.disable

  The hook file is renamed to `commit-msg.disable` so it can be
  re-enabled later with `mix commit_hook.enable`.
  """

  @impl Mix.Task
  def run(_argv) do
    unless File.dir?(".git") do
      Mix.shell().error("Not a Git repository (.git directory not found).")
      exit({:shutdown, 1})
    end

    hooks_dir = Path.join([".git", "hooks"])
    target = Path.join(hooks_dir, "commit-msg")
    disabled = Path.join(hooks_dir, "commit-msg.disable")

    if File.exists?(target) do
      File.rename!(target, disabled)
      Mix.shell().info("Commit hook disabled.")
    else
      Mix.shell().info("No commit hook found to disable.")
    end
  end
end
