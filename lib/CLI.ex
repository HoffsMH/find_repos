defmodule FindRepos.CLI do
  def main([dir] \\ ["~"]) do
    dir
    |> Path.expand()
    |> File.ls!()
    |> Enum.map(&Path.expand(&1, dir))
    |> Enum.filter(&File.dir?/1)
    |> Enum.filter(&File.dir?("#{&1}/.git"))
    |> IO.inspect()
  end
end
