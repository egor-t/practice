def array_by_step
  arr = []
  i = 10
  while i <= 100
    arr << i
    i += 5
  end
  puts arr.to_s
end

array_by_step
