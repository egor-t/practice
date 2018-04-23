# Station functionality
class Station
  include InstanceCounter
  attr_reader :trains
  attr_accessor :name

  @@instances = []

  def initialize(name)
    @@instances << self
    @name = name
    @trains = []
    validate!
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

  def valid?
    validate!
  rescue
    false
  end

  protected

  def validate!
    raise 'Name can not be empty' if name.nil?
    raise 'Name can not be less then 3 symbol' if name.length < 3
    true
  end
end
