puts 'Enter а: '
a = gets.chomp.to_f
puts 'Enter b: '
b = gets.chomp.to_f
puts 'Enter c: '
c = gets.chomp.to_f

discriminant = b**2 - 4 * a * c

if discriminant > 0
  x1 = (-b + Math.sqrt(discriminant)) / (2 * a)
  x2 = (-b - Math.sqrt(discriminant)) / (2 * a)
  puts "x1: #{x1} and x2: #{x2}"
elsif discriminant.zero?
  x = -b / (2 * a)
  puts "x1 and x2 are same: #{x}"
else
  'Thera are not roots in the quadratic equation.'
end
