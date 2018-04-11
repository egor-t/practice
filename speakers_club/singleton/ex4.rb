module Settings4
  def self.add_data(key, value)
    @@data ||= {}
    @@data[key] = value
  end

  def self.data
    @@data ||= {}
  end
end
