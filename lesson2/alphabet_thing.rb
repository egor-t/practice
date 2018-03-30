def alphaber_with_vowels
  arr = ('a'..'z').to_a
  arr.map! { |letter| letter.delete('bcdfghjnpsmlkrtvwxz') }
  arr.delete_if(&:empty?)

  puts arr.compact.to_s
end

alphaber_with_vowels
