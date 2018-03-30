require 'date'

def get_months_with_30days
  months = {}
  months_names = Date::MONTHNAMES

  (1..12).each do |month_number|
    if days_in_month(month_number) == 30 months.merge(months_names[month_number] => 30)
  end

  # months_names = Date::ABBR_MONTHNAMES
  # Date::MONTHNAMES

end

def days_in_month(month, year = Time.now.year)
   return 29 if month == 2 && Date.gregorian_leap?(year)
   Date.new(2018, month, -1).day
end

get_months_with_30days
