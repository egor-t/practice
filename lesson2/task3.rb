def fibonacci_go
  arr = []
  previous_value = 1
  next_value = 1
  while next_value <= 100
    arr.push(1, 1) if next_value == 1
    break if previous_value + next_value >= 100
    arr << previous_value + next_value
    previous_value = next_value
    next_value = arr.last
  end

  puts arr.to_s
end

fibonacci_go
