cart = {}
cart_price = 0

loop do
  puts 'Enter name of product: '
  name = gets.chomp
  break if name == 'stop'
  puts 'Enter price: '
  price = gets.chomp.to_f
  puts 'Enter the quantity of items: '
  count = gets.chomp.to_i

  cart[name] = { price: price, count: count, total_coast: price * count }
  cart_price += cart[name][:total_coast]
end

puts "Our hash: #{cart}"
puts "Total price: #{cart_price}"
