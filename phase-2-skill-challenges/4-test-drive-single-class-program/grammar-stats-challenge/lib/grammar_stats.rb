class GrammarStats
  def initialize
    @text_checked_so_far = 0
    @true_results = 0
  end

  def check(text)
    fail "No text has been passed" if text.empty?
    valid_last_character = [".", "!", "?"]
    words = text.split(" ")
  
    first_letter = words[0][0]
    last_character = words[-1][-1]
    @text_checked_so_far += 1
    result =  first_letter == first_letter.upcase && valid_last_character.include?(last_character)
    @true_results += 1 if result == true
    return result
  end

  def percentage_good
    percentage = ((@true_results * 100.0) /  @text_checked_so_far).to_i
  end
end
