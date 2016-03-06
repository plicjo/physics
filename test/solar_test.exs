defmodule SolarTest do
  use ExUnit.Case
  use Timex
  import Solar.Flare

  setup do
    flares = [
      %Solar.Flare{classification: :X, scale: 99, date: Date.from({1859, 8, 29})},
      %Solar.Flare{classification: :M, scale: 5.8, date: Date.from({2015, 1, 12})},
      %Solar.Flare{classification: :M, scale: 1.2, date: Date.from({2015, 2, 9})},
      %Solar.Flare{classification: :C, scale: 3.2, date: Date.from({2015, 4, 18})},
      %Solar.Flare{classification: :M, scale: 83.6, date: Date.from({2015, 6, 23})},
      %Solar.Flare{classification: :C, scale: 2.5, date: Date.from({2015, 7, 4})},
      %Solar.Flare{classification: :X, scale: 72, date: Date.from({2012, 7, 23})},
      %Solar.Flare{classification: :X, scale: 45, date: Date.from({2003, 11, 4})},
    ]
    {:ok, data: flares}
  end

  test "We have 8 solar flares", %{data: flares} do
    assert length(flares) == 8
  end

  test "calculate the power of each flare", %{data: flares} do
    assert power(Enum.at(flares, 0)) == 99000
    assert power(Enum.at(flares, 1)) == 58
    assert power(Enum.at(flares, 3)) == 3.2
  end

  test "filter flares", %{data: flares} do
    filtered_flares = no_eva(flares)
    assert length(filtered_flares) == 3
  end

  test "deadliest flare", %{data: flares} do
    assert deadliest(flares) == 99000
  end

  test "total flare power", %{data: flares} do
    assert total_flare_power(flares) == 216911.7
  end

  test "a list of flares", %{data: flares} do
    result = flare_list(flares)
    assert result == [
      %{power: 99000, is_deadly: true},
      %{power: 58.0,  is_deadly: false},
      %{power: 12.0,  is_deadly: false},
      %{power: 3.2,   is_deadly: false},
      %{power: 836.0, is_deadly: false},
      %{power: 2.5,   is_deadly: false},
      %{power: 72000, is_deadly: true},
      %{power: 45000, is_deadly: true}
    ]
  end

  test "a Solar Flare is a map with a special key" do
    assert %Solar.Flare{}.__struct__ == Solar.Flare
  end
end
