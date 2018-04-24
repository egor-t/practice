# Passenger carriage class
class PassengerCarriage < Carriage
  attr_reader :total_seats, :reserved_seats

  def initialize(total_seats, company_name)
    @total_seats = total_seats
    @reserved_seats = 0
    super(company_name)
  end

  def type
    :passenger
  end

  def reserve_seat
    self.reserved_seats += 1 if reserved_seats < total_seats
  end

  def free_seats
    total_seats - self.reserved_seats
  end

  def carriage_info
    "TYPE: #{type}, " \
    "RESERVED SEATS: #{reserved_seats}, " \
    "FREE SEATS: #{free_seats}"
  end

  protected

  attr_writer :reserved_seats
end
