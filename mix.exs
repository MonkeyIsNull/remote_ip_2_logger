defmodule RemoteIp2Logger.Mixfile do
  use Mix.Project

  def project do
    [
      app: :remote_ip_2_logger,
      version: "0.2.0",
      elixir: "~> 1.5",
      start_permanent: Mix.env == :prod,
      package: package(),
      description: description(),
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp description() do
    "Puts the ip of the caller into the metadata for the Logger"
  end

  defp deps do
    [
      {:ex_doc, ">= 0.0.0", only: :dev},
      {:plug, "~> 1.0"}
    ]
  end

   defp package() do
    [
      files: ["lib", "mix.exs", "README.md"],
      maintainers: ["Adam Guyot"],
      licenses: ["Apache 2.0"],
      links: %{"GitHub" => "https://github.com/MonkeyIsNull/remote_ip_2_logger"}
    ]
  end
end
