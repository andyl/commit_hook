defmodule Mix.Tasks.CommitHook.Install do
  use Mix.Task

  @shortdoc false

  @impl Mix.Task
  def run(_argv) do
    hooks_dir = Path.join([".git", "hooks"])
    sample = Path.join(hooks_dir, "commit-msg.sample")
    target = Path.join(hooks_dir, "commit-msg")
    source = Path.join(:code.priv_dir(:commit_hook), "commit-msg")

    if File.exists?(sample) do
      File.rm!(sample)
    end

    File.cp!(source, target)
    File.chmod!(target, 0o755)

    Mix.shell().info("Commit hook installed.")
  end
end
