defmodule CommitHook.MixProject do
  use Mix.Project

  @version "0.1.0"

  def project do
    [
      app: :commit_hook,
      version: @version,
      elixir: "~> 1.19",
      start_permanent: Mix.env() == :prod,
      description: "Enable/Disable Conventional Commit checks",
      package: [
      name: "commit_hook",      # Optional: defaults to app name
      licenses: ["MIT"],       # Or MIT, etc.
      links: %{
        "GitHub" => "https://github.com/andyl/commit_hook",
        "Docs" => "https://hexdocs.pm/commit_hook"
      },
      files: ~w(lib mix.exs README.md LICENSE CHANGELOG.md)  # Important: list files to include
    ],

      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:git_ops, "~> 2.0", only: [:dev], runtime: false},
      {:igniter, "~> 0.6", only: [:dev, :test]}
    ]
  end
end
