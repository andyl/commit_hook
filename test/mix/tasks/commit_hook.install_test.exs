defmodule Mix.Tasks.CommitHook.InstallTest do
  use ExUnit.Case, async: true
  import Igniter.Test

  test "it runs without error" do
    test_project()
    |> Igniter.compose_task("commit_hook.install", [])
    |> assert_unchanged()
  end
end
