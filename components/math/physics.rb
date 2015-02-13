require '../../core/node'
require '../../core/dependencies'
require './point.rb'

class Forces < Node
  extend Dependencies

  add_dependency :point, Point

  attr_reader :velocity_x, :velocity_y, :force_x, :force_y
  attr_accessor :drag_x, :drag_y, :acceleration_x, :accelration_y

  def thrust_with_angle(power, angle)

  end

  def add_force(power_x, power_y)

  end
end