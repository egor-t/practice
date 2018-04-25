# Instance counter module
module InstanceCounter
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  # Class methods module
  module ClassMethods
    attr_accessor :instances
  end

  # Instance methods module
  module InstanceMethods
    include ClassMethods

    protected

    def register_instance
      self.class.instances ||= 0
      self.class.instances += 1
    end
  end
end
