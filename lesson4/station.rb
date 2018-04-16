# Station functionality
class Station
  attr_reader :name, :trains

  def initialize(name)
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
end
