class MyInspect

def initialize(whoAmI)
  @whoAmI = whoAmI
end

end

myInspect = MyInspect.new("SuperMan")

puts "Inspect: #{myInspect.inspect}"
