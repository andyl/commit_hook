defmodule Mix.Tasks.CommitHook.Enable do
  use Mix.Task

  @shortdoc "Enable the Conventional Commits commit-msg hook"

  @moduledoc """
  Enables the Conventional Commits commit-msg Git hook.

      $ mix commit_hook.enable

  If the hook was previously disabled, it is renamed back into place.
  Otherwise, a fresh copy is installed from `priv/commit-msg`.
  """

  @impl Mix.Task
  def run(_argv) do
    unless File.dir?(".git") do
      Mix.shell().error("Not a Git repository (.git directory not found).")
      exit({:shutdown, 1})
    end

    hooks_dir = Path.join([".git", "hooks"])
    disabled = Path.join(hooks_dir, "commit-msg.disable")
    sample = Path.join(hooks_dir, "commit-msg.sample")
    target = Path.join(hooks_dir, "commit-msg")
    source = Path.join(:code.priv_dir(:commit_hook), "commit-msg")

    if File.exists?(sample) do
      File.rm!(sample)
    end

    if File.exists?(disabled) do
      File.rename!(disabled, target)
      Mix.shell().info("Disabled hook restored.")
    else
      File.cp!(source, target)
      File.chmod!(target, 0o755)
      Mix.shell().info("New hook created.")
    end

    Mix.shell().info("Hook enabled.")
  end
end
