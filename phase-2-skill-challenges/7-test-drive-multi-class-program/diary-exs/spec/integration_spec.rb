require 'diary' 
require 'diary_entry'

RSpec.describe "The integration between Diary and DiaryEntry" do
  describe ".all method" do
    it "adds the instances of diaryEntry and shows them in a list" do
      diary = Diary.new
      chapter_1 = DiaryEntry.new("Page 1", "Some content")
      chapter_2 = DiaryEntry.new("Page 2", "Some other content")
      diary.add(chapter_1)
      diary.add(chapter_2)
      expect(diary.all).to eq [chapter_1, chapter_2]
    end
  end

  describe ".count_words method" do
    it "counts the words of all of the diary entries" do
      diary = Diary.new
      chapter_1 = DiaryEntry.new("Page 1", "Some content")
      chapter_2 = DiaryEntry.new("Page 2", "Some other content")
      diary.add(chapter_1)
      diary.add(chapter_2)
      expect(diary.count_words).to eq 5
    end
  end

  describe ".reading_time method" do
    it "returns the minutes to read the diary" do
      diary = Diary.new
      chapter_1 = DiaryEntry.new("Page 1", "Some content")
      chapter_2 = DiaryEntry.new("Page 2", "Some other content")
      diary.add(chapter_1)
      diary.add(chapter_2)
      expect(diary.reading_time(5)).to eq 1
    end

    context "fails when wpm == 0 is passed" do
      it "it returns an error message" do
        diary = Diary.new
        chapter_1 = DiaryEntry.new("Page 1", "Some content")
        chapter_2 = DiaryEntry.new("Page 2", "Some other content")
        diary.add(chapter_1)
        diary.add(chapter_2)
        expect{ diary.reading_time(0)}.to raise_error "Wpm must be bigger than 0"
      end
    end
  end

  describe ".find_best_entry_for_reading_time" do
    it "returns the best entry for the given reading time" do
      diary = Diary.new
      chapter_1 = DiaryEntry.new("Page 1", "Some content")
      chapter_2 = DiaryEntry.new("Page 2", "Some other content here")
      diary.add(chapter_1)
      diary.add(chapter_2)
      expect(diary.find_best_entry_for_reading_time(2, 1)).to eq chapter_1
    end
  end
end