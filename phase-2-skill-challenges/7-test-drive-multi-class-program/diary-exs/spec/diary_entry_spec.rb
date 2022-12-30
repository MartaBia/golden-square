require 'diary_entry'

RSpec.describe DiaryEntry do
  it "returns the title and content of the entry" do
    chapter_1 = DiaryEntry.new("Page 1", "Some content")
    expect(chapter_1.title).to eq "Page 1"
    expect(chapter_1.contents).to eq "Some content"
  end

  it "counts the words of my entry" do
    chapter_1 = DiaryEntry.new("Page 1", "Some content")
    expect(chapter_1.count_words).to eq 2
  end

  it "returns 0 for an empty content" do
    chapter_1 = DiaryEntry.new("Page 1", "")
    expect(chapter_1.count_words).to eq 0
  end

  it "returns the minutes to read a chapter" do
    chapter_1 = DiaryEntry.new("Page 1", "Some content")
    expect(chapter_1.reading_time(2)).to eq 1
  end

  it "fails when wpm == 0 is passed" do
    chapter_1 = DiaryEntry.new("Page 1", "Some content")
    expect { chapter_1.reading_time(0) }.to raise_error "Wpm must be bigger than 0"
  end

  it "it returns the contents that the readers has to read in the given time" do
    chapter_1 = DiaryEntry.new("Page 1", "Some content here")
    expect(chapter_1.reading_chunk(2, 1)).to eq "Some content"
  end

  it "returns the next piece of text when called again" do
    chapter_1 = DiaryEntry.new("Page 1", "Some content here")
    chapter_1.reading_chunk(2, 1)
    expect(chapter_1.reading_chunk(2, 1)).to eq "here"
  end

  it "returns the beginnign of the text when after being called a few times the text ends" do
    chapter_1 = DiaryEntry.new("Page 1", "Some content written here")
    chapter_1.reading_chunk(2, 1)
    chapter_1.reading_chunk(2, 1)
    expect(chapter_1.reading_chunk(2, 1)).to eq "Some content"
  end
end