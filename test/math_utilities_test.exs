defmodule MathUtilitiesTest do
  use ExUnit.Case
  doctest MathUtilities

  test "round to nearest tenth" do
    assert MathUtilities.to_nearest_tenth(12.34) == 12.4
    assert MathUtilities.to_nearest_tenth(1.59) == 1.6
  end

  test "meters to kilometers" do
    assert MathUtilities.to_km(1000) == 1
  end
end
