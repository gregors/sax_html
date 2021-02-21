defmodule SaxHtml.MixProject do
  use Mix.Project

  @version "0.2.0"
  @repo_url "https://github.com/gregors/sax_html"


  def project do
    [
      app: :sax_html,
      version: @version,
      elixir: "~> 1.11",
      start_permanent: Mix.env() == :prod,
      name: "sax_html",
      description: description(),
      package: package(),
      source_url: @repo_url,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end

  defp description() do
    "Simple SAX parser for HTML"
  end

  defp package() do
    [
      maintainers: ["Gregory Ostermayr"],
      licenses: ["MIT"],
      links: %{"GitHub" => @repo_url}
    ]
  end
end
