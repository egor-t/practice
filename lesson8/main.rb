# frozen_string_literal: true

require_relative 'route'
require_relative 'instance_counter'
require_relative 'station'
require_relative 'carriage'
require_relative 'passenger_carriage'
require_relative 'cargo_carriage'
require_relative 'train'
require_relative 'passenger_train'
require_relative 'cargo_train'
require 'pry'

# Basic class for ui part
class Main
  include InstanceCounter

  attr_accessor :trains, :stations, :action

  ACTIONS = {
    1 => :create_station,
    2 => :stations_list,
    3 => :trains_on_station,
    4 => :add_train_to_station,
    5 => :create_train,
    6 => :add_car_to_train,
    7 => :remove_car_from_train,
    8 => :grep_train,
    9 => :reserve_seat,
    10 => :reserve_space
  }

  def initialize
    @trains = []
    @stations = []
    @action = nil
  end

  def ui
    loop do
      grep_action_number
      break if action.zero?
      self.send(ACTIONS[action]) rescue puts 'Incorrect number'
    end
  end

  private

  def grep_action_number
    puts '
      Enter the action number:
      1 - Create station
      2 - List of stations
      3 - All trains on station
      4 - Add train on station
      5 - Create train
      6 - Add carriege to train
      7 - Remove carriege from train
      8 - Find a train by number
      9 - Take a place of carriage
      10 - Take a space of carriage
    '

    self.action = gets.chomp.to_i
  end

  # Staion block !START!
  def create_station
    puts 'Enter some name of station: '
    name = gets.chomp
    stations << Station.new(name)
    puts "Station was created with name: #{name}."
  end

  def stations_list
    puts stations.map(&:name).join(' ')
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
    stations.select { |station| station.name == name }.first
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
      puts "All trains on this station: #{station.name}"
      station_info(station)
    else
      puts 'Some problem with staion.'
    end
  end

  def station_info(station)
    station.staion_each_train do |train|
      puts "Info:  № #{train.number}, TYPE: #{train.type}"
      train.block_each_carriage do |carriage|
        puts "=> #{carriage.carriage_info}"
      end
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
      trains << PassengerTrain.new(number)
      puts "Passenger train was created with number: #{number}"
    when 2
      trains << CargoTrain.new(number)
      puts "Cargo train was created with number: #{number}"
    else
      puts 'Something goes wrong..'
    end
  rescue StandardError => e
    puts e.message
    retry
  end

  def trains_list(type = nil)
    if type
      trains.map { |train| train.type == type }
    else
      trains.map(&:number)
    end
  end

  # Train block !END!

  # Carriage block !START!

  def add_car_to_train
    train = grep_train
    return 'Some problem with train' unless train

    puts 'Enter name of company'
    company_name = gets.chomp

    case train.type
    when :passenger
      puts 'Enter number of seats for carriages: '
      total_seats = gets.chomp.to_i
      train.add_train_car(PassengerCarriage.new(total_seats, company_name))
    when :cargo
      puts 'Enter space for carriages: '
      total_space = gets.chomp.to_i
      train.add_train_car(CargoCarriage.new(total_space, company_name))
    else
      puts 'Train was not found'
    end
  end

  def train_by_number(number)
    Train.find(number)
  end

  def grep_train
    puts "Available trains: #{trains_list}"
    puts 'Enter the number of train: '
    number = gets.chomp
    train_by_number(number)
  end

  def remove_car_from_train
    train = grep_train
    if train.kick_train_car
      puts 'Train was removed.'
    else
      puts 'Train still exist.'
    end
  end

  def reserve_seat
    train = grep_train
    raise 'We can not reserve space because it is passanger carriage' if train.type == :cargo
    puts "№: #{train.number}, TYPE: #{train.type}, Carriages: #{train.carriages.count}"

    carriage_index = 1
    train.block_each_carriage do |carriage|
      puts "#{carriage_index} => #{carriage.carriage_info}"
      carriage_index += 1
    end
    puts 'Choose carriage by number'
    carriage_index = gets.chomp.to_i
    carriage = train.carriages[carriage_index - 1]
    carriage.reserve_seat
    puts 'You are reserve seat'
  end

  def reserve_space
    train = grep_train
    raise 'We can not reserve seats because it is cargo carriage' if train.type == :passenger
    puts "№: #{train.number}, TYPE: #{train.type}, Carriages: #{train.carriages.count}"

    carriage_index = 1
    train.block_each_carriage do |carriage|
      puts "#{carriage_index} => #{carriage.carriage_info}"
      carriage_index += 1
    end
    puts 'Choose carriage by number'
    carriage_index = gets.chomp.to_i
    carriage = train.carriages[carriage_index - 1]

    puts 'Enter the volume you want to reserve.'
    puts "Available space: #{carriage.remaining_carriage_space}"
    voulume_reserve = gets.chomp.to_i
    carriage.take_carriage_space(voulume_reserve)
    puts 'You are reserve some space'
  end
  # Carriage block !END!
end

Main.new.ui
