defmodule Mix.Tasks.CommitHook.Info do
  use Mix.Task

  @shortdoc "Show valid fields for a Convtional Commit message"

  @info_message """
  Conventional Commit Format: <type>[(optional scope)]: <description>"
  Valid types: feat, fix, chore, docs, test, style, refactor, perf, build, ci, revert"
  Example: feat(api): add user authentication"
  Full spec: https://www.conventionalcommits.org"
  Githooks info: https://git-scm.com/book/en/v2/Customizing-Git-Git-Hooks
  """

  @moduledoc """
  Show valid fields for a Conventional Commit message.

  #{@info_message}
  """

  @impl Mix.Task
  def run(_argv) do
    IO.puts(@info_message |> String.trim())
  end
end
