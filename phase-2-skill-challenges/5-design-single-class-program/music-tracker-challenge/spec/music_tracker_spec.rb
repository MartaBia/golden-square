require 'music_tracker'

RSpec.describe MusicTracker do
  it "returns No songs added if no song is entered" do
    song_entry = MusicTracker.new
    expect(song_entry.list).to eq "No songs added"
  end

  it "returns one song list when one song is entered" do
    song_entry = MusicTracker.new
    song_entry.add("Yesterday") 
    expect(song_entry.list).to eq "Yesterday"
  end

  it "returns a multiple songs list when more than one song is entered" do
    song_entry = MusicTracker.new
    song_entry.add("Yesterday") 
    song_entry.add("Bohemian Rapsody")
    expect(song_entry.list).to eq "Yesterday, Bohemian Rapsody"
  end

  it "return only a song only once if entered twice" do
    song_entry = MusicTracker.new
    song_entry.add("Yesterday") 
    song_entry.add("Yesterday")
    expect(song_entry.list).to eq "Yesterday"
  end

end