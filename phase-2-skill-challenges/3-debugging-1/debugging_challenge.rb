def get_most_common_letter(text)
  counter = Hash.new(0)
  special_chars = [" ", ",", ".", "!", "?"]
  text.chars.each do |char|
    counter[char] += 1 unless special_chars.include?(char)
  end
  puts "counter: #{counter}"
  counter.to_a.max_by { |k, v| v }[0][0]
end

puts get_most_common_letter("the roof, the roof, the roof is on fire!")

# Intended output:
# 
# > get_most_common_letter("the roof, the roof, the roof is on fire!")
# => "o"