defmodule CommitHookTest do
  use ExUnit.Case
  doctest CommitHook

  test "greets the world" do
    assert CommitHook.hello() == :world
  end
end
