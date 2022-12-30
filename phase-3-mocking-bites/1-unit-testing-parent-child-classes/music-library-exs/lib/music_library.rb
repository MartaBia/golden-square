class MusicLibrary
  def initialize
    @library = []
  end

  def add(track) 
    return @library.push(track)
  end

  def all
    return @library
  end
  
  def search(keyword) 
    return @library.select { |track| track.matches?(keyword) }
  end
end