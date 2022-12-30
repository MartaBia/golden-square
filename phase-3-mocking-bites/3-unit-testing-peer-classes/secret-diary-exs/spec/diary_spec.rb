require 'diary'

RSpec.describe Diary do
  it "reads the entry of diary" do
    diary = Diary.new("Here's the content of my diary")
    expect(diary.read).to eq "Here's the content of my diary"
  end
end