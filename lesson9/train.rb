require_relative 'route'
require_relative 'company'

# Main class of train functionality
class Train
  include Company
  include Validation

  NUMBER_FORMAT = /(\w{3})(_?)(\w{2})/i
  @@instances = {}

  validate :number, :presence
  validate :number, :format, NUMBER_FORMAT

  attr_reader :speed, :carriages, :type, :index_stop
  attr_accessor :number

  def initialize(number)
    @@instances[number] = self
    @number = number
    @speed = 0
    @carriages = []
    @route = nil
    @index_stop = 0
    validate!
  end

  def add_route(route)
    self.route = route
  end

  def current_stop
    route.stops[index_stop]
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

  def add_train_car(carriage)
    @carriages << carriage if @speed.zero? && carriage.type == type
  end

  def kick_train_car
    @carriages.delete(@carriages.last) if @speed.zero? && @carriages.count.positive?
  end

  def speed_up(speed = 10)
    @speed = speed
  end

  def speed_down(speed)
    @speed = speed
  end

  def go_to_next_stop
    self.index_stop += 1 if next_stop_index
  end

  def go_to_previous_stop
    self.index_stop -= 1 if index_stop != 0
  end

  def block_each_carriage
    carriages.each { |carriage| yield(carriage) }
  end

  def self.find(number)
    @@instances[number]
  end

  protected

  attr_writer :route, :carriages, :index_stop
end
