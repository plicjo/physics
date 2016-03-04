defmodule Physics.Rocketry do
  import MathUtilities
  import Physics.Laws

  def orbital_acceleration(height), do: orbital_acceleration(Planets.earth,height)
  def orbital_acceleration(:earth, height), do: orbital_acceleration(Planets.earth,height)
  def orbital_acceleration(:mars, height), do: orbital_acceleration(Planets.mars,height)
  def orbital_acceleration(:moon, height), do: orbital_acceleration(Planets.moon,height)
  def orbital_acceleration(planet, height) do
    (orbital_speed(planet, height) |> squared) / orbital_radius(planet, height)
  end

  def orbital_term(height), do: orbital_term(Planets.earth, height)
  def orbital_term(:mars, height), do: orbital_term(Planets.mars, height)
  def orbital_term(:earth, height), do: orbital_term(Planets.earth, height)
  def orbital_term(:moon, height), do: orbital_term(Planets.moon, height)
  def orbital_term(planet, height) do
    4 * (:math.pi |> squared) * (orbital_radius(planet,height) |> cubed) / (newtons_gravitational_constant * planet.mass)
                  |> square_root
                  |> seconds_to_hours
  end


  defp orbital_speed(height), do: orbital_speed(Planets.earth,height)
  defp orbital_speed(planet,height) do
    newtons_gravitational_constant * planet.mass / orbital_radius(planet, height)
    |> square_root
  end

  defp orbital_radius(height), do: orbital_radius(Planets.earth, height)
  defp orbital_radius(planet, height) do
    planet.radius + (height |> to_m)
  end

  defp calculate_escape(%{mass: mass, radius: radius}) do
    2 * newtons_gravitational_constant * mass / radius
    |> square_root
  end
end
