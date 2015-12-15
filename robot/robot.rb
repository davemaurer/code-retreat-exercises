require_relative 'errors'

class Robot
  attr_reader :bearing, :coordinates

  def initialize
    @facings = [:north, :east, :south, :west]
    @coordinates = [0, 0]
  end

  def orient(direction)
    RaiseError.direction_error(direction)
    find_rotation(direction)
    set_bearing
  end

  def find_rotation(direction)
    until @facings.first == direction do
      @facings.rotate!
    end
  end

  def set_bearing
    @bearing = @facings.first
  end

  def turn_right
    @facings.rotate!
    set_bearing
  end

  def turn_left
    @facings.rotate!(-1)
    set_bearing
  end

  def at(x, y)
    @coordinates = [x, y]
  end

  def advance
    @coordinates[find_x_or_y] += find_plus_or_minus
  end

  def find_x_or_y
    xy_possibilities = { north: 1, south: 1, east: 0, west: 0 }
    xy_possibilities[@bearing]
  end

  def find_plus_or_minus
    add_possibilities = { north: 1, east: 1, south: -1, west: -1 }
    add_possibilities[@bearing]
  end
end
