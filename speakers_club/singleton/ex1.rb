require 'singleton'

class Settings1
  include Singleton

  attr_accessor :config

  def initialize
    @config = {}
  end

  def add_data(key, value)
    @config[key] = value
  end

  def info
    puts 'My ID is #{object_id}'
  end
end
