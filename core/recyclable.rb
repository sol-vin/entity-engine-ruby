module Recyclable
  module RecyclableInstance
    attr_reader :recycled, :recycled_objects
    def reset(template)
      self.class.reset(self, template)
    end
  end

  include RecyclableInstance


  @templates = {}

  def included base
    base.extend(Recyclable)
  end

  def make_template key, &block
    @templates[key] = block
  end

  def reset(object, template)
    object.instance_exec &@templates[template]
  end
end