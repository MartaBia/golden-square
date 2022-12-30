class PhoneNumberCrawler
  def initialize(diary) 
    @diary = diary
  end 

  def extract_number
    return @diary.entries.flat_map do |entry|
      extract_number_from_entry(entry)
    end.uniq
  end

  private

  def extract_number_from_entry(entry)
    return entry.contents.scan(/07[0-9]{9}/)
  end
end