require 'track'

RSpec.describe Track do
  it "Returns false if the keyword does not match either the title or artist" do
    track = Track.new("Bohemian Rapsody", "Queen")
    expect(track.matches?("Beatles")).to eq false
  end

  it "Returns true if the keyword matches either the title or artist" do
    track = Track.new("Bohemian Rapsody", "Queen")
    expect(track.matches?("Rapsody")).to eq true
  end
end