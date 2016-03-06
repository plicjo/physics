defmodule Solar do
  def power(%{classification: :X, scale: scale}), do: scale * 1000
  def power(%{classification: :M, scale: scale}), do: scale * 10
  def power(%{classification: :C, scale: scale}), do: scale * 1

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
