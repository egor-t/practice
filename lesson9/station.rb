require_relative 'validation'
# Station functionality
class Station
  include InstanceCounter
  include Validation

  attr_reader :trains
  attr_accessor :name

  validate :name, :presence
  @@instances = []

  def initialize(name)
    @name = name
    @trains = []
    @@instances << self
    validate!
  end

  def take_train(train)
    trains << train
  end

  def send_train(train)
    trains.delete(train)
  end

  def show_all_trains
    puts "All trains: #{@trains}"
  end

  def show_trains_by_type(type)
    trains.select { |train| train.type == type }
  end

  def self.all_stations
    @@instances
  end

  def staion_each_train
    trains.each { |train| yield(train) }
  end
end
