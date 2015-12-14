class Robot
  attr_reader :bearing

  def orient(direction)
    @bearing = direction
    raise ArgumentError unless [:east, :west, :north, :south].include?(direction)
  end
end
