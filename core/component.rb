require '../core/node'

class Component < Node
  attr_reader :parent

  def initialize(*args)
    @parent = args[1]if(args.length == 2)
    super(args[0])
  end
end