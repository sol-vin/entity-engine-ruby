module Events
  def included? base
    base.extend Events
  end

  def events *args
    args.each do |name|
      instance_variable_set('@' + name, Event.new)
      self.class.define_method("when_#{name}") { |*e_args| raise "abstract method raised when_#{name}"}
      self.class.define_method("fire_#{name}") { |*e_args| instance_variable_get("@#{name}").fire(*e_args)}
      instance_variable_get('@' + name).add_callback(method("when_#{name}"))
    end
  end
end

class Event < Array
  def add_callback(method = nil, &block)
    if block_given?
      push(block)
    else
      @callbacks.push(method)
    end
  end

  def fire(*args)
    @callbacks.reverse_each { |handler| handler.call(*args) }
  end


  #breaking methods
  def []= a; end
  def & a; end
  def * a; end
  def + a; end
  def - a; end
  def / a; end
end