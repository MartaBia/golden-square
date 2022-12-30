class Diary
  def initialize
    @diary_entries = []
  end

  def add(entry)
    @diary_entries.push(entry)
  end

  def entries
    return @diary_entries
  end
end