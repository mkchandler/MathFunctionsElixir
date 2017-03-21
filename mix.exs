defmodule MathFunctions.Mixfile do
  use Mix.Project

  def project do
    [app: :math_functions,
     version: "0.1.0",
     elixir: "~> 1.4",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     test_coverage: [tool: Coverex.Task, coveralls: true],
     deps: deps()]
  end

  def application do
    [extra_applications: [:logger]]
  end

  defp deps do
    [{:coverex, "~> 1.4.10", only: :test},
     {:credo, "~> 0.7", only: [:dev, :test]}]
  end
end

