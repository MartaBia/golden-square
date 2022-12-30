# {{PROBLEM}} Multi-Class Planned Design Recipe

## 1. Describe the Problem

As a user
So that I can keep a list of my music tracks

As a user
So that I can add tracks one by one

As a user
So that I can serch music tracks by a keyword

## 2. Design the Class System

_Consider diagramming out the classes and their relationships. Take care to
focus on the details you see as important, not everything. The diagram below
uses asciiflow.com but you could also use excalidraw.com, draw.io, or miro.com_

```
┌────────────────────────────┐
│ MusicPlayer                │
│                            │
│ - add(track)               │
│ - all                      │
│ - search_by_title(keyword) │
│   => [tracks...]           │
└───────────┬────────────────┘
            │
            │ owns a list of
            ▼
┌─────────────────────────┐
│ Track(title, artist)    │
│                         │
│ - title                 │
│ - artist                │
│ - format                │
│   => "TITLE by ARTIST"  │
└─────────────────────────┘
```

_Also design the interface of each class in more detail._

```ruby
class MusicLibrary
  def initialize
    # ...
  end

  def add(track) # track is an instance of Track
    # Track gets added to the library
    # Returns nothing
  end

  def all
    # Returns a list of track objects
  end
  
  def search(keyword) # keyword is a string
    # Returns a list of tracks that match the keyword
  end
end

class Track
  def initialize(title, artist) # title and artist are both strings
  end

  def matches?(keyword) # keyword is a string
    # Returns true if the keyword matches either the title or artist
  end
end
```

## 3. Create Examples as Integration Tests

```ruby
# EXAMPLE

# Gets all tracks
library = MusicLibrary.new
track_1 = Track.new("Bohemian Rapsody", "Queen")
track_2 = Track.new("Eleonor Rigby", "The Beatles")
library.add(track_1)
library.add(track_2)
library.all # => [track_1, track_2]

library = MusicLibrary.new
track_1 = Track.new("Bohemian Rapsody", "Queen")
track_2 = Track.new("Eleonor Rigby", "The Beatles")
library.add(track_1)
library.add(track_2)
library.search("Queen") # => [track_1]

library = MusicLibrary.new
track_1 = Track.new("Bohemian Rapsody", "Queen")
track_2 = Track.new("Hello, goodbye", "The Beatles")
track_3 = Track.new("Hello", "Adele")
library.add(track_1)
library.add(track_2)
library.add(track_3)
library.search("Hello") # => [track_2, track_3]

```

## 4. Create Examples as Unit Tests

```ruby

# Track tests
track = Track.new("Bohemian Rapsody", "Queen")
expect(track.matches?("Beatles")).to eq false

track = Track.new("Bohemian Rapsody", "Queen")
expect(track.matches?("Rapsody")).to eq true

# MusicLibrary tests
library = MusicLibrary.new 
expect(library.all).to eq []

```

_Encode each example as a test. You can add to the above list as you go._

## 5. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green,
refactor to implement the behaviour.  