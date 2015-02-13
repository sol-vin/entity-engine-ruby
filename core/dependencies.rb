module Dependencies
  module DependenciesInstance
    attr_reader :dependencies
    @dependencies = {}

    def fill_dependency(name, dependency)
      raise ArgumentError.new("#{name} was not found in dependencies!") unless self.class.dependencies.includes? name
      @dependencies[name] = dependency
    end

    def dependencies_fufilled?
      (self.class.dependencies.keys.sort - @dependencies.keys.sort).length == 0
    end
  end

  include DependenciesInstance

  attr_reader :dependencies
  @dependencies = {} #name, expected type

  def included(base)
    base.extend(Dependencies)
  end

  protected

  def add_dependency(key, expected_class)
    @dependencies[key] = expected_class
  end

  def add_dependencies(*args)
    @dependencies.merge! args
  end
end