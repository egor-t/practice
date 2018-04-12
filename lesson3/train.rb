require_relative 'station'
require_relative 'route'

# Train functionality
class Train
  attr_accessor :route, :index_stop
  attr_reader :speed, :carriages, :type, :number

  TYPE_OF_TRAIN = %w[passenger freight]

  def initialize(number, type)
    @number = number
    @type = type
    @speed = 0
    @carriages = []
    @route = nil
    @index_stop = 0
  end

  def add_route(route)
    self.route = route
  end

  def add_train_car
    @carriages += 1 if @speed.zero?
  end

  # We understand that head of the train does not count.
  def kick_train_car
    @carriages -= 1 if @speed.zero? && @carriages.count.positive?
  end

  def speed_up(speed = 10)
    @speed = speed
  end

  def speed_down(speed)
    @speed = speed
  end

  def current_stop
    self.route.stops[index_stop]
  end

  def next_stop_index
    route.stops[index_stop + 1] if route.stops.count > index_stop
  end

  def previous_stop_index
    if index_stop.zero?
      route.stops[index_stop]
    else
      route.stops[index_stop - 1]
    end
  end

  def go_to_next_stop
    self.index_stop += 1 if next_stop_index
  end

  def go_to_previous_stop
    self.index_stop -= 1 if index_stop != 0
  end
end
