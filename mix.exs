defmodule CommitHook.MixProject do
  use Mix.Project

  @version "0.4.1"

  def project do
    [
      app: :commit_hook,
      version: @version,
      elixir: "~> 1.19",
      start_permanent: Mix.env() == :prod,
      description: "Enable/Disable Conventional Commit checks",
      docs: docs(),
      package: [
      name: "commit_hook",
      licenses: ["MIT"],
      links: %{
        "GitHub" => "https://github.com/andyl/commit_hook",
        "Docs" => "https://hexdocs.pm/commit_hook"
      },
      files: ~w(lib priv mix.exs README.md CHANGELOG.md LICENSE)
    ],

      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp docs do
    [
      main: "readme",
      extras: [{"README.md", title: "Overview"}],
      source_url: "https://github.com/andyl/commit_hook",
      source_ref: "v#{@version}"
    ]
  end

  defp deps do
    [
      {:git_ops, "~> 2.0", only: [:dev], runtime: false},
      {:igniter, "~> 0.6", only: [:dev, :test]},
      {:ex_doc, "~> 0.37", only: :dev, runtime: false}
    ]
  end
end
