require 'diary_entry'

RSpec.describe DiaryEntry do
  it "construct" do
    diary_entry = DiaryEntry.new("My title", "My contents")
    expect(diary_entry.title).to eq "My title"
    expect(diary_entry.contents).to eq "My contents"
  end
end