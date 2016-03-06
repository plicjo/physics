defmodule Solar.Flare do
  defstruct [
    classification: :M,
    scale: 0,
    power: 0,
    is_deadly: false,
    date: nil
  ]

  def load(flares) do
    for flare <- flares, do: flare |> calculate_power |> calculate_deadliness
  end

  def calculate_power(flare) do
    factor = case flare.classification do
      :M -> 10
      :X -> 1000
      :C -> 1
    end
    %{flare | power: flare.scale * factor}
  end

  def calculate_deadliness(flare) do
    %{flare | is_deadly: flare.power > 1000}
  end

  def no_eva(flares) do
    Enum.filter flares, fn(flare) -> power(flare) > 1000 end
  end

  def deadliest(flares) do
    Enum.map(flares, &(power(&1)))
     |> Enum.max
  end

  def total_flare_power(flares) do
    Enum.reduce flares, 0, fn(flare,total) ->
      power(flare) + total
    end
  end

  def flare_list(flares) do
    Enum.map flares, fn(flare) ->
      p = power(flare)
      %{power: p, is_deadly: p > 1000}
    end
  end
end
