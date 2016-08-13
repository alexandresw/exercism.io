defmodule SpaceAge do
  @type planet :: :mercury | :venus | :earth | :mars | :jupiter
                | :saturn | :neptune | :uranus

  @doc """
  Return the number of years a person that has lived for 'seconds' seconds is
  aged on 'planet'.
  """
  @spec age_on(planet, pos_integer) :: float
  def age_on(planet, seconds) do
    convert(planet, seconds / 31557600)
  end

  def convert(:mercury, year), do: year / 0.2408467
  def convert(:venus, year), do: year / 0.61519726
  def convert(:mars, year), do: year / 1.8808158
  def convert(:jupiter, year), do: year / 11.862615
  def convert(:saturn, year), do: year / 29.447498
  def convert(:uranus, year), do: year / 84.016846
  def convert(:neptune, year), do: year / 164.79132
  def convert(_, year), do: year

end
