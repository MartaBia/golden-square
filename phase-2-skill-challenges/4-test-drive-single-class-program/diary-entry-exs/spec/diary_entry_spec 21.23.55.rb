require 'diary_entry'

RSpec.describe DiaryEntry do
  it "constructs the diary" do
    new_entry = DiaryEntry.new("my_title", "my_content")
    expect(new_entry.title).to eq "my_title"
    expect(new_entry.contents).to eq "my_content"
  end

  describe "#count_words" do
    it "returns the number of the words in the contents" do
      new_entry = DiaryEntry.new("my_title", "some content here")
      expect(new_entry.count_words).to eq 3
    end

    it "returns 0 if the content is empty" do
      new_entry = DiaryEntry.new("my_title", "")
      expect(new_entry.count_words).to eq 0
    end
  end

  describe "#reading time" do
    context "When given a sensible wpm number (200)" do
      it "return the ceiling of the number of minutes it takes to read the content" do
        new_entry = DiaryEntry.new("my_title", "one " * 550)
        expect(new_entry.reading_time(200)).to eq 3
      end
    end

    context "given a wpm of 0" do
      it "fails" do
        new_entry = DiaryEntry.new("my_title", "one, two, three")
        expect { new_entry.reading_time(0) }.to raise_error "Reading speed must be above 0"
      end
    end
  end

  describe "#reading_chunk" do
    context "with a content readable within the given minutes" do
      it "returns the full content" do
        new_entry = DiaryEntry.new("my_title", "one two three")
        chunk = new_entry.reading_chunk(200, 1)
        expect(chunk).to eq "one two three"
      end
    end

    context "with a content unreadable within the minutes" do
      it "return a readable chunk" do
        new_entry = DiaryEntry.new("my_title", "one two three")
        chunk = new_entry.reading_chunk(2, 1)
        expect(chunk).to eq "one two"
      end

      it "returns the next chunk the next time it's called" do
        new_entry = DiaryEntry.new("my_title", "one two three")
        new_entry.reading_chunk(2, 1)
        chunk = new_entry.reading_chunk(2, 1)
        expect(chunk).to eq "three"
      end

      it "restarts after reading the whole content" do
        new_entry = DiaryEntry.new("my_title", "one two three")
        new_entry.reading_chunk(2, 1)
        new_entry.reading_chunk(2, 1)
        chunk = new_entry.reading_chunk(2, 1)
        expect(chunk).to eq "one two"
      end
    end
  end
end