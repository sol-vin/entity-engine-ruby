require '../../core/node'
require '../../data/vector2'

class Point < Node
  def initialize(name, vector2)
    super(name)
    @vector2 = vector2
  end

  def to_v2
    @vector2.clone
  end

  def x
    @vector2.x
  end

  def y
    @vector2.y
  end

  def x= new_x
    @vector2.x = new_x
  end

  def y= new_y
    @vector2.y = new_y
  end
end