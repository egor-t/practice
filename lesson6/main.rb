require_relative 'route'
require_relative 'station'
require_relative 'carriage'
require_relative 'passenger_carriage'
require_relative 'cargo_carriage'
require_relative 'train'
require_relative 'passenger_train'
require_relative 'cargo_train'
require_relative 'instance_counter'

# Basic class for ui part
class Main
  attr_accessor :trains, :stations, :action

  def initialize
    @trains = []
    @stations = []
    @action = nil
  end

  def ui
    loop do
      grep_action_number
      break if action.zero?
      case action
      when 1
        create_station
      when 2
        stations_list
      when 3
        trains_on_station
      when 4
        add_train_to_station
      when 5
        create_train
      when 6
        add_car_to_train
      when 7
        remove_car_from_train
      when 8
        grep_train
      end
    end
  end

  private

  def grep_action_number
    puts %q(
      Enter the action number:
      1 - Create station
      2 - List of stations
      3 - All trains on station
      4 - Add train on station
      5 - Create train
      6 - Add carriege to train
      7 - Remove carriege from train
      8 - Find a train by number
    )

    self.action = gets.chomp.to_i
  end

  # Staion block !START!
  def create_station
    puts 'Enter some name of station: '
    name = gets.chomp
    self.stations << Station.new(name)
    puts "Station was created with name: #{name}."
  end

  def stations_list
    puts self.stations.map(&:name).join(' ')
    puts '****************************'
    puts Station.all_stations
  end

  def grep_station
    puts "All possible stations: #{stations_list}"
    puts 'Enter station name: '
    name = gets.chomp
    station_by_name(name)
  end

  def station_by_name(name)
    self.stations.select { |station| station.name == name }.first
  end

  def add_train_to_station
    station = grep_station
    train = grep_train
    if station && train
      station.take_train(train)
      puts "The train #{train.number} is successfuly added to station: #{station.name}"
    else
      puts 'Some problem with staion or train creation.'
    end
  end

  def trains_on_station
    station = grep_station
    if station
      puts "All trains on this station: #{station.trains}"
    else
      puts 'Some problem with staion.'
    end
  end

  # Station block !END!

  # Train block !START!

  def create_train
    puts 'What type of train do you want to create: 1 - passenger or 2 - cargo:'
    type = gets.chomp.to_i
    puts 'Enter the number of train: '
    number = gets.chomp

    case type
    when 1
      self.trains << PassengerTrain.new(number)
      puts "Passenger train was created with number: #{number}"
    when 2
      self.trains << CargoTrain.new(number)
      puts "Cargo train was created with number: #{number}"
    else
      puts 'Something goes wrong..'
    end
  rescue => e
    puts e.message
    retry
  end

  def trains_list(type = nil)
    if type
      self.trains.map { |train| train.type == type }
    else
      self.trains.map(&:number)
    end
  end

  # Train block !END!

  # Carriage block !START!

  def add_car_to_train
    train = grep_train
    return 'Some problem with train' unless train
    case train.type
    when :passenger
      train.add_train_car(PassengerCar.new)
    when :cargo
      train.add_train_car(CargoCar.new)
    else
      puts 'Train was not found'
    end
  end

  def grep_train
    puts "Available trains: #{trains_list}"
    puts 'Enter the number of train: '
    number = gets.chomp
    puts self.trains.find(number)
  end

  def remove_car_from_train
    train = grep_train
    if train.kick_train_car
      puts 'Train was removed.'
    else
      puts 'Train still exist.'
    end
  end

  # Carriage block !END!
end

Main.new.ui