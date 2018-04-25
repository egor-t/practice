# Metaprogramming - Module
module Accessor
  @@history = []
  def attr_accessor_with_history(*methods)
    methods.each do |method|
      name = "@#{method}"

      define_method(method) { instance_variable_get(name) }

      define_method("#{method}=") do |value|
        instance_variable_set(name, value)
        @@history << value
      end

      define_method("#{method}_history") { puts @@history }
    end
  end

  def strong_attr_acessor(attr_name, class_name)
    name = "@#{attr_name}"

    define_method(attr_name) { instance_variable_get(name) }

    define_method("#{attr_name}=") do |value|
      if value.is_a?(class_name)
        instance_variable_set(name, value)
      else
        raise TypeError.new("Should be like a #{class_name}")
      end
    end
  end
end
