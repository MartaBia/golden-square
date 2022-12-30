require 'diary'
require 'diary_entry'
require 'phone_number_crawler'
require 'diary_reader'

RSpec.describe "diary integration" do
  it "adds diary entry to a list" do
    diary = Diary.new
    entry_1 = DiaryEntry.new("My title", "My contents")
    entry_2 = DiaryEntry.new("My title two", "My contents two")
    diary.add(entry_1)
    diary.add(entry_2)
    expect(diary.entries).to eq [entry_1, entry_2]
  end

  describe "diary reading behaviour" do
    context "whrere there is a perfect diary entry to read in the time" do
      it "finds that entry" do
        diary = Diary.new
        reader = DiaryReader.new(2, diary)
        entry_1 = DiaryEntry.new("title1", "One")
        entry_2 = DiaryEntry.new("title2", "One two")
        entry_3 = DiaryEntry.new("title3", "One two three")
        entry_4 = DiaryEntry.new("title4", "One two three four")
        entry_5 = DiaryEntry.new("title5", "One two three four five")
        diary.add(entry_1)
        diary.add(entry_2)
        diary.add(entry_3)
        diary.add(entry_4)
        diary.add(entry_5)
        expect(reader.find_most_readable(2)).to eq entry_4
      end
    end

    context "when the best entry is a bit shorter than optimum" do 
      it "returns that entry" do
        diary = Diary.new
        reader = DiaryReader.new(2, diary)
        entry_1 = DiaryEntry.new("title1", "One")
        entry_2 = DiaryEntry.new("title2", "One two")
        entry_3 = DiaryEntry.new("title3", "One two three")
        entry_4 = DiaryEntry.new("title4", "One two three four five")
        diary.add(entry_1)
        diary.add(entry_2)
        diary.add(entry_3)
        diary.add(entry_4)
        expect(reader.find_most_readable(2)).to eq entry_3
      end
    end

    context "When non of the entries are readable in the given time" do
      it "returns nil" do
        diary = Diary.new
        reader = DiaryReader.new(2, diary)
        entry_1 = DiaryEntry.new("title1", "One two three four five")
        diary.add(entry_1)
        expect(reader.find_most_readable(2)).to eq nil
      end
    end

    context "When there are no entries and therefore nothing readable" do
      it "returns nil" do
        diary = Diary.new
        reader = DiaryReader.new(2, diary)
        expect(reader.find_most_readable(2)).to eq nil
      end
    end

    context "where wpm is invalid" do
      it "fails" do
        diary = Diary.new
        expect { 
          DiaryReader.new(0, diary) 
        }.to raise_error "wpm must be above 0"
      end
    end
  end

  describe "phone extractor behaviour" do
    it "extraxt the phone numbers from the diary entries" do
      diary = Diary.new
      phone_book = PhoneNumberCrawler.new(diary)
      diary.add(DiaryEntry.new("Title 0", "Maria hasn't got a phone"))
      diary.add(DiaryEntry.new("Title 1", "Anna's number 07000000000"))
      diary.add(DiaryEntry.new("Title 2", "Anna's number 07000000000, Luke's number 07000000001 and Mario's number 07000000002. Mario's number 07000000002 again"))
      expect(phone_book.extract_number).to eq [
        "07000000000",
        "07000000001",
        "07000000002",
      ]
    end

    it "doesn't extract invalid numbers" do
      diary = Diary.new
      phone_book = PhoneNumberCrawler.new(diary)
      diary.add(DiaryEntry.new("Title 1", "Various number 070000000 10712345678"))
      expect(phone_book.extract_number).to eq []
    end
  end
end