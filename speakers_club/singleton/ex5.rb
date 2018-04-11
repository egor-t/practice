module Settings5
  module_function

  def add_data(key, value)
    @data ||= {}
    @data[key] = value
  end

  def data
    @data ||= {}
  end
end
