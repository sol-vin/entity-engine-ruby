require './shape'

class Rectangle < Shape
  attr_accessor :width, :height

  def initialize(x, y, width, height)
    @x = x
    @y = y
    @width = width
    @height = height
  end

  # :up_left, :up_right, :down_left, :down_right
  def get_corner(key)
    #disect the key
    x_corner = 0
    y_corner = 0
    if key.to_s.include? "right"
      x_corner = 1
    end
    if key.to_s.include? "down"
      y_corner = 1
    end
    x_corner = ((x_corner == 0) ? x : x + width)
    y_corner = ((y_corner == 0) ? y : y + height)
    Vector2.new(x_corner, y_corner)
  end

  def is_aabb?
    angle == 0 || angle == 90 || angle == 180 || angle == 240
  end
end