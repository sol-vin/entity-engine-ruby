class RootNode < Array
  attr_reader :name
  attr_reader :id

  attr_accessor :active, :visibile, :initialized, :destroyed

  def initialize name
    @name = name
    @destroyed = true
    @initialized = true
    @active = true
    @visible = true
  end

  def [] name
    find {|node| node.name == name}
  end

  def is_root?
    true
  end

  def delete key, &block
    self[key].destroy
    super(key)
  end

  def destroy
    each {|c| c.destroy}
    @parent = nil
    @active = false
    @visible = false
    @destroyed = true
  end


  def update

  end


  def update_children
    values.each { |c| c.update; c.update_children}
  end

  def draw

  end


  #breaking methods
  def []= a; end
  def & a; end
  def * a; end
  def + a; end
  def - a; end
  def / a; end
end