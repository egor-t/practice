class Train

  attr_accessor :speed, :number, :type, :carriages

  def initialize(number, type)
    @number = number
    @type = type
    @speed = 0
    @carriages = []
  end

  def add_train_car
    @carriages += 1
  end

  def kick_train_car
    @carriages -= 1
  end

end
