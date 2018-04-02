def alphaber_with_vowels
  alphaber = ('a'..'z')
  vowels = %w(a e i o u)
  our_hash = {}

  alphaber.each_with_index do |letter, index|
    our_hash["#{letter}"] = index + 1 if vowels.include?(letter)
  end

  puts our_hash.to_s
end

alphaber_with_vowels
