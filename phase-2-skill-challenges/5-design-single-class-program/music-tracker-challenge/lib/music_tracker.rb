class MusicTracker
  def initialize 
    @music_list = []
  end

  def add(song) 
    @music_list.push(song) unless @music_list.include?(song) 
  end

  def list
    return "No songs added" if @music_list.empty?
    return @music_list.join(", ")
  end
end