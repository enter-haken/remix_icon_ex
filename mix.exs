defmodule RemixIconEx.MixProject do
  use Mix.Project

  def project do
    [
      app: :remix_icon_ex,
      version: "0.1.0",
      elixir: "~> 1.11",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      aliases: aliases()
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
      {:phoenix_html, "~> 2.14", runtime: false}
    ]
  end
end
