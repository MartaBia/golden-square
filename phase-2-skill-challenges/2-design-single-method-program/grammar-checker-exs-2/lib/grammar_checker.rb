def check_grammar(sentence)
  return false if sentence.empty?
  valid_last_character = [".", "!", "?"]
  words = sentence.split(" ")

  first_letter = words[0][0]
  last_character = words[-1][-1]
  if first_letter == first_letter.upcase && valid_last_character.include?(last_character)
    true
  else
    false
  end
end

puts check_grammar("this is a sentence.")