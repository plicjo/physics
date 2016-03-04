defmodule PhysicsRocketryTest do
  use ExUnit.Case
  doctest Physics.Rocketry

  test "escape velocity of earth" do
    assert Physics.Rocketry.escape_velocity(:earth) == 11.2
  end

  test "escape velocity of a planet" do
    { planet_mass, planet_radius } = { 3.0e18, 4.51e3 }
    assert Physics.Rocketry.escape_velocity(%{ mass: planet_mass, radius: planet_radius }) == 0.3
  end
end
