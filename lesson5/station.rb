# Station functionality
class Station
  include InstanceCounter
  attr_reader :name, :trains

  @@instances = []

  def initialize(name)
    @@instances << self
    @name = name
    @trains = []
  end

  def take_train(train)
    self.trains << train
  end

  def send_train(train)
    self.trains.delete(train)
  end

  def show_all_trains
    puts "All trains: #{@trains}"
  end

  def show_trains_by_type(type)
    self.trains.select { |train| train.type == type }
  end

  def self.all_stations
    @@instances
  end
end
