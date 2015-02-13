require 'math'

class Vector2 < Struct(:x, :y)
  #class methods
  def self.dot_product(a, b)
    a.x * b.x + a.y * b.y
  end

  def self.get_normal(a, b)
    (b - a).normalize
  end

  def self.cross_product(a, b)
    if (a.is_a? Vector2) && (b.is_a? Vector2)
      a.x * b.y - a.y * b.x
    elsif a.is_a? Vector2
      Vector2.new(a.y * b, a.x * -b)
    elsif b.is_a? Vector2
      Vector2.new(b.y * -a, b.x * a)
    end
  end

  def self.rotate_point(origin, angle, point)
    s = Math.sin(angle)
    c = Math.cos(angle)

    x_new = point.x - origin.x
    y_new = point.y - origin.y

    x_new = (x_new * c - y_new * s) + origin.x
    y_new = (x_new * s + y_new * c) + origin.y

    Vector2.new(x_new, y_new)
  end

  def self.get_angle(v2)
    get_line_angle(Vector2.zero, v2)
  end

  def self.get_line_angle(a, b)
    Math.atan2(a.x - b.x, a.y - b.y)
  end

  def self.zero
    Vector2.new(0, 0)
  end

  def self.one
    Vector2.new(1, 1)
  end

  def self.unit_x
    Vector2.new(1, 0)
  end

  def self.unit_y
    Vector2.new(0, 1)
  end

  def initialize(x = 0, y = 0)
    @x = x
    @y = y
  end

  def normalize

  end

  def normalize!

  end

  def length
    Math.hypot(x.abs, y.abs)
  end

  #handle operands
  def method_missing(name, *args)
    if [:+, :-, :*, :/, :%].include? name
      if args[0].is_a? Numeric
        Vector2.new(x.send(name, args[0]), y.send(name, args[0]))
      elsif args[0].is_a? Vector2
        Vector2.new(x.send(name, args[0].x), y.send(name, args[0].y))
      end

    end
  end
end