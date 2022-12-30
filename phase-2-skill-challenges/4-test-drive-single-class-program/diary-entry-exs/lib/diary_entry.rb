class DiaryEntry
  def initialize(title, contents)
    @title = title
    @contents = contents
    @furtherst_word_read = 0
  end

  def title
    return @title
  end

  def contents
    return @contents
  end

  def count_words
    return 0 if @contents.empty?
    @contents.split(" ").length
  end

  def reading_time(wpm) 
    fail "Reading speed must be above 0" if wpm <= 0
    content_length = @contents.split(" ").length
    reading_time = (content_length / wpm.to_f).ceil
  end

  def reading_chunk(wpm, minutes) 
    words_to_read = wpm * minutes
    contents_array = @contents.split(" ")
    
    @furtherst_word_read = 0 if @furtherst_word_read > count_words 
    end_at = @furtherst_word_read + words_to_read
    text_to_print = contents_array[@furtherst_word_read ... end_at]
    @furtherst_word_read = end_at
    return text_to_print.join(" ")
  end
end