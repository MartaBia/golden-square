# Diary Multi-Class Planned Design Recipe

## 1. Describe the Problem

As a user
So that I can record my experiences
I want to keep a regular diary

As a user
So that I can reflect on my experiences
I want to read my past diary entries
t
As a user
So that I can reflect on my experiences in my busy day
I want to select diary entries to read based on how much time I have and my reading speed

As a user
So that I can keep track of my tasks
I want to keep a todo list along with my diary

As a user
So that I can keep track of my contacts
I want to see a list of all of the mobile phone numbers in all my diary entries

## 2. Design the Class System

_Consider diagramming out the classes and their relationships. Take care to
focus on the details you see as important, not everything. The diagram below
uses asciiflow.com but you could also use excalidraw.com, draw.io, or miro.com_

## Nouns
Diary
Experiences - diary entries
Todo list
Phone book

## Verbs
list of entries
read
reading in some time
Keep todos
Show phone book


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

class Diary
  def initialize
    @diary_entry_list = []
  end

  def add(instance) #entry is an instnace of the class DiaryEntries
    #it adds the entry into the diary class
  end

  def list_all
    #lists all the entries of the diary
  end

  def list_diary_entry
    #lists all the entries of the diary
  end

  def list_contacts
  #lists all the entries of the diary
  end

  def list_todos
    #shows all the entries of the diary
  end

  def reading_time(wpm) #wps is an integer that represents the words per minute read by the user
    #returns an integer that represents the reading time of an entry
  end

  def find_best_entry_for_reading_time(wpm, minutes) #wps is an integer that represents the words per minute read by the user
                                  #minutes is an integer representing the minutes the users has to read
    #returns the most optimal entry in comparison to reading time and words per minutes  
  end
end

class DiaryEntry
  def initialize(title, content)
    @title = title
    @content = content
  end

  def title
    #returns the entry's title
  end

  def content
  #returns the entry's content
  end

  def reading_time(wpm) #wps is an integer that represents the words per minute read by the user
  #returns an integer that represents the reading time of an entry
  end

  def reading_chunk(wpm, minutes) #wps is an integer that represents the words per minute read by the user
                                  #minutes is an integer representing the minutes the users has to read
    #returns the most optimal entry in comparison to reading time and words per minutes  
  end
end

class Task
  def initialize(todo)
    #creates a list of tasks
  end
end

class Contacts
  def initialize(name, phone_number)
    #creates a list of phone numbers
  end
end

```

## 3. Create Examples as Integration Tests

_Create examples of the classes being used together in different situations and
combinations that reflect the ways in which the system will be used._

```ruby
# EXAMPLE

#1
#Shows the list of entries
diary = Diary.new
chapter_1 = DiaryEntry.new("Title", "Content")
task_1 = Task.new("Walk dog")
contact_1 = Contacts.new("Luke", "07123 456 789")
diary.add(chapter_1)
diary.add(task_1)
diary.add(contact_1)
diary.list_all #=> [chapter_1, task_1, contact_1]

#2
diary = Diary.new
chapter_1 = DiaryEntry.new("Title", "Content")
task_1 = Task.new("Walk dog")
contact_1 = Contacts.new("Luke", "07123 456 789")
diary.add(chapter_1)
diary.add(task_1)
diary.add(contact_1)
diary.list_diary_entry #=> [chapter_1]

#3
diary = Diary.new
chapter_1 = DiaryEntry.new("Title", "Content")
task_1 = Task.new("Walk dog")
contact_1 = Contacts.new("Luke", "07123 456 789")
diary.add(chapter_1)
diary.add(task_1)
diary.add(contact_1)
diary.list_contacts #=> [contact_1]

#4
diary = Diary.new
chapter_1 = DiaryEntry.new("Title", "Content")
task_1 = Task.new("Walk dog")
contact_1 = Contacts.new("Luke", "07123 456 789")
diary.add(chapter_1)
diary.add(task_1)
diary.add(contact_1)
diary.list_todos #=> [task_1]

#-------
diary = Diary.new
chapter_1 = DiaryEntry.new("Title", "Content here")
diary.add(chapter_1)
diary_entry.count_words #=> 2

diary = Diary.new
chapter_1 = DiaryEntry.new("Title", "Content here")
diary.add(chapter_1)
diary_entry.reading_time(2) #=> 1

diary = Diary.new
chapter_1 = DiaryEntry.new("Title", "Content here")
chapter_2 = DiaryEntry.new("Title2", "Some other content here")
diary.add(chapter_1)
diary_entry.reading_chunk(2, 1) #=> "Content here"

```

## 4. Create Examples as Unit Tests

_Create examples, where appropriate, of the behaviour of each relevant class at
a more granular level of detail._

```ruby
# EXAMPLE

# Shows title ane content
chapter_1 = DiaryEntry.new("Title", "Content")
chapter_1.title #=> "Title"
chapter_1.content #=> "Content"

```

_Encode each example as a test. You can add to the above list as you go._

## 5. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green,
refactor to implement the behaviour._