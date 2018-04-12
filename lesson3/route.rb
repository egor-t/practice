# Route functionality
class Route
  attr_accessor :stops

  def initialize(start_point, end_point)
    @stops = [start_point, end_point]
  end

  def add_middle_stop(stop)
    self.stops.insert(-2, stop)
  end

  def delete_middle_stop(stop)
    self.stops.delete(stop) if stop != @stops[0] && stop != @stops[-1]
  end

  def show_all_stops
    puts @stops
  end
end
