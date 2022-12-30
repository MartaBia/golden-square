require 'music_library'

RSpec.describe MusicLibrary do
  it "construct" do
    library = MusicLibrary.new
    expect(library.all).to eq []
  end

  describe "testing MusicLibrary with mocking" do
    it "returns a list of all the existing tracks" do
      library = MusicLibrary.new
      track_1 = double :track
      track_2 = double :track
      library.add(track_1)
      library.add(track_2)
      expect(library.all).to eq [track_1, track_2]
    end
  end

  it "return a matching track when inserted a keyword" do
    library = MusicLibrary.new
    track_1 = double :track, matches?: true
    track_2 = double :track, matches?: false
    library.add(track_1)
    library.add(track_2)
    expect(library.search("Queen")).to eq [track_1]
  end

  it "return multiple matching tracks when keyword present in multiple entries" do
    library = MusicLibrary.new
    track_1 = double :track, matches?: false
    track_2 = double :track, matches?: true
    track_3 = double :track, matches?: true
    library.add(track_1)
    library.add(track_2)
    library.add(track_3)
    expect(library.search("Hello")).to eq [track_2, track_3]
  end

  it "returns an empty list if the keyword does not matches any entries" do
    library = MusicLibrary.new
    track_1 = double :track, matches?: false 
    track_2 = double :track, matches?: false 
    track_3 = double :track, matches?: false 
    library.add(track_1)
    library.add(track_2)
    library.add(track_3)
    expect(library.search("Love")).to eq []
  end
end