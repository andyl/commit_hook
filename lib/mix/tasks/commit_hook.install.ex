defmodule Mix.Tasks.CommitHook.Install do
  use Igniter.Mix.Task

  @moduledoc false

  @impl Igniter.Mix.Task
  def info(_argv, _composing_task) do
    %Igniter.Mix.Task.Info{}
  end

  @impl Igniter.Mix.Task
  def igniter(igniter) do
    IO.puts("commit_hook installed...")
    igniter
  end
end
