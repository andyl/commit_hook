defmodule Mix.Tasks.CommitHook.Install.Docs do
  @moduledoc false

  @spec short_doc() :: String.t()
  def short_doc do
    "Install commit_hook"
  end

  @spec example() :: String.t()
  def example do
    "mix commit_hook.install"
  end

  @spec long_doc() :: String.t()
  def long_doc do
    """
    #{short_doc()}
    """
  end
end

if Code.ensure_loaded?(Igniter) do
  defmodule Mix.Tasks.CommitHook.Install do
    @shortdoc "#{__MODULE__.Docs.short_doc()}"

    @moduledoc __MODULE__.Docs.long_doc()

    use Igniter.Mix.Task

    @impl Igniter.Mix.Task
    def info(_argv, _composing_task) do
      %Igniter.Mix.Task.Info{
        group: :commit_hook,
        adds_deps: [],
        installs: [],
        example: __MODULE__.Docs.example(),
        only: [:dev],
        dep_opts: [runtime: false],
        positional: [],
        composes: [],
        schema: [],
        defaults: [],
        aliases: [],
        required: []
      }
    end

    @impl Igniter.Mix.Task
    def igniter(igniter) do
      igniter
    end
  end
else
  defmodule Mix.Tasks.CommitHook.Install do
    @shortdoc "#{__MODULE__.Docs.short_doc()} | Install `igniter` to use"

    @moduledoc false

    use Mix.Task

    @impl Mix.Task
    def run(_argv) do
      Mix.shell().error("""
      The task 'commit_hook.install' requires igniter. Please install igniter and try again.

      For more information, see: https://hexdocs.pm/igniter/readme.html#installation
      """)

      exit({:shutdown, 1})
    end
  end
end
