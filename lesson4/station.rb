# Station functionality
class Station
  attr_reader :name

  def initialize(name)
    @name = name
    @trains = []
  end

  def take_train(train)
    @trains << train
  end

  def send_train(train)
    @trains.delete(train)
  end

  def show_all_trains
    puts "All trains: #{@trains}"
  end

  def show_trains_by_type
    # TODO: "Something"
  end
end
