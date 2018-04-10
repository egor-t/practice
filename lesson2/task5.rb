require 'date'

def find_day_number
  puts 'Enter day:'
  day = gets.chomp.to_i
  puts 'Enter month:'
  month = gets.chomp.to_i
  puts 'Enter year:'
  year = gets.chomp.to_i

  day_numbers = 0

  (1..month).each do |index|
    if index != month
      day_numbers += days_in_month(index, year)
    else
      day_numbers += day
    end
  end

  puts day_numbers
end

def days_in_month(month, year)
  return 29 if month == 2 && ((year % 4 == 0 && year % 100 != 0) || year % 400 == 0)
  Date.new(year, month, -1).day
end

find_day_number
