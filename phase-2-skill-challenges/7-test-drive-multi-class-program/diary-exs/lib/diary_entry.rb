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
    @contents.split(" ").length
  end

  def reading_time(wpm)
    fail "Wpm must be bigger than 0" if wpm <= 0
    return (count_words / wpm.to_f).ceil
  end

  def reading_chunk(wpm, minutes) 
    words_to_read = wpm * minutes
    contents_array = @contents.split(" ")
    
    @furtherst_word_read = 0 if @furtherst_word_read >= count_words 
    end_at = @furtherst_word_read + words_to_read
    text_to_print = contents_array[@furtherst_word_read ... end_at]
    @furtherst_word_read = end_at
    return text_to_print.join(" ")
  end
end