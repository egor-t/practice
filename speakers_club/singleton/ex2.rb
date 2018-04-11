class Settings2
  attr_reader :config

  def initialize
    @config = {}
  end

  @@instance = Settings2.new

  def self.instance
    @@instance
  end

  def add_data(key, value)
    @config[key] = value
  end

  def info
    puts "My ID is #{object_id}"
  end

  private_class_method :new
end
