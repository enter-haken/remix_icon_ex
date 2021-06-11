defmodule RemixIconEx.MixProject do
  use Mix.Project

  @version File.read!("VERSION") |> String.trim()

  def project do
    [
      app: :remix_icon_ex,
      version: @version,
      elixir: "~> 1.11",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      aliases: aliases(),
      docs: docs()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  def aliases do
    [
      icons: "run icons.exs"
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
end
