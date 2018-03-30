require 'date'

def find_day_number(day, month, year)
  Date.today
end

def days_in_month(month, year)
  return 29 if month == 2 && (year % 4 || year % 400).zero?
  Date.new(year, month, -1).day
end
