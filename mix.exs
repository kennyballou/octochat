defmodule Octochat.Mixfile do
  use Mix.Project

  def project do
    [app: :octochat,
     description: "Demo Application for How Swapping Code",
     package: package(),
     version: "0.2.1",
     elixir: "~> 1.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     docs: docs(),
     deps: deps()]
  end

  def application do
    [applications: [:logger],
     mod: {Octochat.Application, []}]
  end

  defp deps do
    [{:credo, "~> 0.5", only: :credo},
     {:distillery, "~> 0.10", only: [:dev, :prod]},
     {:earmark, "~> 0.2", only: :docs},
     {:ex_doc, "~> 0.12", only: :docs}]
  end

  defp package do
    [maintainers: ["Kenny Ballou"],
     licenses: ["GPL-3.0"],
     links: %{"Git" => "https://git.devnulllabs.io/octochat.git",
              "GitHub" => "https://github.com/kennyballou/octochat"},
     files: ~w(mix.exs README.md LICENSE lib)]
  end

  defp docs do
    [extras: ["README.md" | get_markdown_files("docs")]]
  end

  defp get_markdown_files(path) do
    :filelib.fold_files(path, ".*", true, fn(file, acc) -> [file|acc] end, [])
      |> Enum.filter(fn(file) -> String.ends_with?(file, ".md") end)
  end

end
