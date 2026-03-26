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
    hooks_dir = Path.join([".git", "hooks"])
    disabled = Path.join(hooks_dir, "commit-msg.disable")
    target = Path.join(hooks_dir, "commit-msg")

    if File.exists?(disabled) do
      File.rename!(disabled, target)
    else
      source = Path.join(:code.priv_dir(:commit_hook), "commit-msg")
      File.cp!(source, target)
      File.chmod!(target, 0o755)
    end

    Mix.shell().info("Commit hook enabled.")
  end
end
