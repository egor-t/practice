class Route
  attr_reader :stops

  def initialize(start_point, end_point)
    @stops = [start_point, end_point]
  end

  def add_middle_stop(stop)
    @stops.insert(-2, stop)
  end

  def delete_middle_stop(stop)
    @stops.delete(stop) if stop != @stops[0] && stop != @stops[-1]
  end

  def show_all_stops
    puts "All stops: #{@stops}"
  end
end
