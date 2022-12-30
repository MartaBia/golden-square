require 'music_library'
require 'track'

RSpec.describe "integration" do
  it "returns a list of all the existing tracks" do
    library = MusicLibrary.new
    track_1 = Track.new("Bohemian Rapsody", "Queen")
    track_2 = Track.new("Eleonor Rigby", "The Beatles")
    library.add(track_1)
    library.add(track_2)
    expect(library.all).to eq [track_1, track_2]
  end

  it "return a matching track when inserted a keyword" do
    library = MusicLibrary.new
    track_1 = Track.new("Bohemian Rapsody", "Queen")
    track_2 = Track.new("Eleonor Rigby", "The Beatles")
    library.add(track_1)
    library.add(track_2)
    expect(library.search("Queen")).to eq [track_1]
  end

  it "return multiple matching tracks when keyword present in multiple entries" do
    library = MusicLibrary.new
    track_1 = Track.new("Bohemian Rapsody", "Queen")
    track_2 = Track.new("Hello, goodbye", "The Beatles")
    track_3 = Track.new("Hello", "Adele")
    library.add(track_1)
    library.add(track_2)
    library.add(track_3)
    expect(library.search("Hello")).to eq [track_2, track_3]
  end

  it "returns an empty list if the keyword does not matches any entries" do
    library = MusicLibrary.new
    track_1 = Track.new("Bohemian Rapsody", "Queen")
    track_2 = Track.new("Hello", "Adele")
    track_3 = Track.new("Wonderwall", "Oasis")
    library.add(track_1)
    library.add(track_2)
    library.add(track_3)
    expect(library.search("Love")).to eq []
  end
end