puts 'Enter your name: '
name = gets.chomp
puts 'Enter your height: '
height = gets.chomp.to_i

ideal_weight = height - 110

if ideal_weight.negative?
  puts 'Your weight is awesome!'
else
  puts "#{name}, ideal weight is: #{ideal_weight}"
end
