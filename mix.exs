defmodule UeberauthBexio.MixProject do
  use Mix.Project

  @source_url "https://github.com/smart-software-engineering/ueberauth_bexio"
  @version "0.1.3"

  def project do
    [
      app: :ueberauth_bexio,
      version: @version,
      name: "Ueberauth Bexio",
      elixir: "~> 1.15",
      start_permanent: Mix.env() == :prod,
      package: package(),
      deps: deps(),
      docs: docs()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :oauth2, :ueberauth]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:oauth2, "~> 1.0 or ~> 2.0"},
      {:ueberauth, "~> 0.10.0"},
      {:jason, "~> 1.4"},
      {:ex_doc, ">= 0.0.0", only: [:dev], runtime: false},
      {:mock, "~> 0.3", only: :test}
    ]
  end

  defp docs do
    [
      extras: ["CHANGELOG.md", "CONTRIBUTING.md", "README.md"],
      main: "readme",
      source_url: @source_url,
      homepage_url: @source_url,
      formatters: ["html"]
    ]
  end

  defp package do
    [
      description: "An Uberauth strategy for Bexio authentication.",
      files: ["lib", "mix.exs", "README.md", "CHANGELOG.md", "CONTRIBUTING.md", "LICENSE"],
      maintainers: ["Rico Metzger"],
      licenses: ["MIT"],
      links: %{
        Changelog: "https://hexdocs.pm/ueberauth_bexio/changelog.html",
        GitHub: @source_url
      }
    ]
  end
end
