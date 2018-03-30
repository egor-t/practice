require 'date'

def get_months_with_30days
  monts_wtih_30days = {}
  all_months_for_check = {}
  months_names = Date::MONTHNAMES
  months = (1..12).to_a

  months.each do |month|
    monts_wtih_30days[months_names[month]] = 30 if days_in_month(month) == 30
    all_months_for_check.merge!(months_names[month] => days_in_month(month))
  end

  puts monts_wtih_30days
  puts all_months_for_check
end

def days_in_month(month, year = Time.now.year)
  return 29 if month == 2 && Date.gregorian_leap?(year)
  Date.new(2018, month, -1).day
end

get_months_with_30days
