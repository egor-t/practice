class Route
  attr_reader :stops

  def initialize(start_point, end_point)
    @stops = [start_point, end_point]
  end

  def add_middle_stop(stop)
    @stops.merge(stop)
  end

  def delete_middle_stop(stop)
    @middle_stops.delete(stop)
  end

  def show_all_stops
    puts "All stops: #{@stops}"
  end
end
