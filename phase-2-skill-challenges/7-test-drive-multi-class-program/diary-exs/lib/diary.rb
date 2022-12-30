class Diary
  def initialize
    @diary_list = []
  end

  def add(entry)
    @diary_list.push(entry)
  end

  def all
    return @diary_list
  end

  def count_words
    @diary_list.sum(&:count_words) #review &:count_words
  end

  def reading_time(wpm) 
    fail "Wpm must be bigger than 0" if wpm <= 0
    return (count_words / wpm.to_f).ceil
  end

  def find_best_entry_for_reading_time(wpm, minutes)
    return readable_entries(wpm, minutes).max_by do |entry|
      entry.count_words
    end
  end

  def readable_entries(wpm, time)
    return @diary_list.reject do |entry|
      entry.reading_time(wpm) > time
    end
  end_at
end