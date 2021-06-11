defmodule RemixIconEx.MixProject do
  use Mix.Project

  @version File.read!("VERSION") |> String.trim()

  def project do
    [
      app: :remix_icon_ex,
      name: "RemixIconEx",
      description: "Provide remix icons.",
      version: @version,
      elixir: "~> 1.11",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: package(),
      docs: docs()
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
      {:sweet_xml, "~> 0.6.6", runtime: false},
      {:phoenix_html, "~> 2.14", runtime: false},
      {:ex_doc, "~> 0.24.2", only: :dev, runtime: false}
    ]
  end

  defp docs() do
    [
      main: "RemixIconEx",
      source_rev: "v#{@version}"
    ]
  end

  defp package do
    [
      maintainers: ["Jan Frederik Hake"],
      licenses: ["MIT"],
      source_url: "https://github.com/enter-haken/remix_icon_ex",
      links: %{github: "https://github.com/enter-haken/remix_icon_ex"},
      files: ~w(lib .formatter.exs mix.exs README.md LICENSE VERSION remix_icons/icons)
    ]
  end
end
