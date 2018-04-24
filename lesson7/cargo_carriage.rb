class CargoCarriage < Carriage
  attr_reader :carriage_space, :occupied_space

  def initialize(carriage_space, company_name)
    @carriage_space = carriage_space
    @occupied_space = 0
    super(company_name)
  end

  def type
    :cargo
  end

  def take_carriage_space(volume)
    self.occupied_space += volume if remaining_carriage_space >= volume
  end

  def remaining_carriage_space
    carriage_space - self.occupied_space
  end

  def carriage_info
    "TYPE: #{type}, " \
    "OCCUPIED VOLUME: #{occupied_space}, " \
    "REMAINING SPACE: #{remaining_carriage_space}"
  end

  protected

  attr_accessor :occupied_space
end