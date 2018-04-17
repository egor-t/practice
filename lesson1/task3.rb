puts 'Enter а: '
a = gets.chomp.to_f
puts 'Enter b: '
b = gets.chomp.to_f
puts 'Enter c: '
c = gets.chomp.to_f

sum_of_sides = a * 2 + b * 2
conclusion = 'Our triangle is: '

if a == b && b == c && a == c
  conclusion += 'equilateral but not rectangular!'
elsif sum_of_sides == c * 2 && a == b
  conclusion += 'rectangular and also is isosceles'
else
  conclusion += 'rectangular'
end

puts conclusion
