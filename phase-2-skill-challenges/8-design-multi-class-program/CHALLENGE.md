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

_Also design the interface of each class in more detail._

```ruby

class Diary
  def initialize
    @diary_entry_list = []
  end

  def add(diary_entry) #entry is an instnace of the class DiaryEntries
    #it adds the entry into the diary class
  end

  def show_diary
    #shows all the entries of the diary
  end

  def reading_time(wpm) #wps is an integer that represents the words per minute read by the user
    #returns an integer that represents the reading time of an entry
  end

  def reading_chunk(wpm, minutes) #wps is an integer that represents the words per minute read by the user
                                  #minutes is an integer representing the minutes the users has to read
    #returns the most optimal entry in comparison to reading time and words per minutes  
  end
end

class DiaryEntry
  def initialize(title, content)
  end

  def title
    #returns the entry's title
  end

  def content
  #returns the entry's content
  end
end

class TodoList
  def initialize
    #creates a list of tasks
  end

  def add(task)
    #add the tasks into the list
  end

  def show_list
    #shows the list of todos
  end
end

class Todo
  def initialize(task) #task is a string representing the thing to do
    # ...
  end
end

class PhoneBook
  def initialize
    #creates a list of phone numbers
  end

  def extract_numbers(diary) #diary is the istance of diary representing the entries list
    #it produces no outcome
  end

  def show_phonebook
    #it shows the lists of numbers
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
chapter_2 = DiaryEntry.new("An other title", "Some other content")
diary.add(chapter_1)
diary.show_diary #=> [chapter_1, chapter_2]

#2
#returns the most optimal entry in comparison to reading time and words per minutes  
diary = Diary.new
chapter_1 = DiaryEntry.new("Title", "Content")
chapter_2 = DiaryEntry.new("An other title", "Some other content")
diary.add(chapter_1)
diary.add(chapter_2)
diary.reading_chunk(1, 1) #=> "Content"

# #shows a list of all numbers
# diary = Diary.new
# phone_book = PhoneBook.new
# chapter_1 = DiaryEntry("Title", "Anna's phone: 07234 123333")
# diary.add(chapter_1)
# phone_book.extract_number(diary) #=> ["07234 123333"]

#3
#shows the entire phone book
diary = Diary.new
phone_book = PhoneBook.new
chapter_1 = DiaryEntry("Title", "Anna's phone: 07234 123333")
chapter_1 = DiaryEntry("Title", "Luke's phone: 07234 123355")
diary.add(chapter_1)
diary.add(chapter_2)
phone_book.extract_number(diary)
phone_book.show_phonebook #=> ["07234 123333", "07234 123355"]

#4
#shows the list of todos
todo_list = TodoList.new
task_1 = Todo.new("Walk dog")
task_2 = Todo.new("Buy milk")
todo_list.add(task_1)
todo_list.add(task_2)
todo_list.show_list #=> ["Walk dog", "Buy milk"]

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
