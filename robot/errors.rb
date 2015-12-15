class RaiseError
  def self.direction_error(direction)
    raise ArgumentError unless [:east, :west, :north, :south].include?(direction)
  end
end
