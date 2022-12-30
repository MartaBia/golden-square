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

<!-- ```
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
``` -->

_Also design the interface of each class in more detail._

```ruby

class Diary
  def add(entry) # Entry is an istance ofz DiaryEntry class
  end

  def entries
    # Returns a list of the DiaryEntries
  end
end

class DiaryEntry
  def initialize(title, contents) # Title and contents are both strings
  end

  def title
    #returns a the title of the entry as a string
  end

  def contents
    #returns a the contents of the entry as a string
  end
end

class PhoneNumberCrawler
  def initialize(diary) # Diary is an instance of Diary class
  end 

  def extract_number
    # Returns a list of strings representing phone numbers
    # gathered across all diary entries
  end
end

class DiaryReader
  def initialize(wpm, diary) 
    # wpm is an integer representing the wornds per minute read by the user
    # diary is an instance of the class Diary
  end

  def find_most_readable(time)
    # Returns an instance of DiaryEntry corresponding to the entry with 
    # the longest content which is still readable within the time given
  end
end

class TaskList
  def add(task) # Task is an instance of class Task
  end

  def all
    # Returns a list of tasks
  end
end

class Task
  def initialize(title) #title is a string representing the task
  end

  def title
    # Returns the title as a string
  end
end
```

## 3. Create Examples as Integration Tests

_Create examples of the classes being used together in different situations and
combinations that reflect the ways in which the system will be used._

```ruby
# As a user
# So that I can record my experiences
# I want to keep a regular diary

# As a user
# So that I can reflect on my experiences
# I want to read my past diary entries

#1
diary = Diary.new
entry_1 = DiaryEntry.new("My title", "My contents")
entry_2 = DiaryEntry.new("My title two", "My contents two")
diary.add(entry_1)
diary.add(entry_2)
expect(diary.entries).to eq [entry_1, entry_2]


# As a user
# So that I can reflect on my experiences in my busy day
# I want to select diary entries to read based on how much time I have and my reading speed

#2 - fits exactly
diary = Diary.new
reader = DiaryReader.new(2, diary)
entry_1 = DiaryEntry.new("title1", "One")
entry_2 = DiaryEntry.new("title2", "One two")
entry_3 = DiaryEntry.new("title3", "One two three")
entry_4 = DiaryEntry.new("title4", "One two three four")
entry_5 = DiaryEntry.new("title5", "One two three four five")
diary.add(entry_1)
diary.add(entry_2)
diary.add(entry_3)
diary.add(entry_4)
diary.add(entry_5)
expect(reader.find_most_readable(2)).to eq entry_4

#3 - does not fits exactly
diary = Diary.new
reader = DiaryReader.new(2, diary)
entry_1 = DiaryEntry.new("title1", "One")
entry_2 = DiaryEntry.new("title2", "One two")
entry_3 = DiaryEntry.new("title3", "One two three")
entry_4 = DiaryEntry.new("title4", "One two three four five")
diary.add(entry_1)
diary.add(entry_2)
diary.add(entry_3)
diary.add(entry_4)
expect(reader.find_most_readable(2)).to eq entry_3

#4 - nothing readable
diary = Diary.new
reader = DiaryReader.new(2, diary)
entry_1 = DiaryEntry.new("title1", "One two three four five")
diary.add(entry_1)
expect(reader.find_most_readable(2)).to eq nil

#5 - nothing at all readable
diary = Diary.new
reader = DiaryReader.new(2, diary)
expect(reader.find_most_readable(2)).to eq nil

#6 - wpm invalid
diary = Diary.new
reader = DiaryReader.new(0, diary) #should fail "wpm must be above 0"

# As a user
# So that I can keep track of my tasks
# I want to keep a todo list along with my diary

#7
task_list = TaskList.new
task_1 = Task.new("Walk the dog")
task_2 = Task.new("Buy the bread")
task_list.add(task_1)
task_list.add(task_2)
expect(task_list.all).to eq [task_1, task_2]

# As a user
# So that I can keep track of my contacts
# I want to see a list of all of the mobile phone numbers in all my diary entries

#8
diary = Diary.new
phone_book = PhoneNumberCrawler.new(diary)
diary.add(DiaryEntry.new("Title", "Anna's number 0700 000 0000"))
diary.add(DiaryEntry.new("Title 2", "Anna's number 0700 000 0000, Luke's number 0700 000 0001 and Mario's number 0700 000 0002. Mario's number 0700 000 0002 again"))
expect(phone_book.extract_number).to eq [
  "0700 000 0000"
  "0700 000 0001"
  "0700 000 0002"
]


```

## 4. Create Examples as Unit Tests

_Create examples, where appropriate, of the behaviour of each relevant class at
a more granular level of detail._

```ruby
# Do this as we go along
```

_Encode each example as a test. You can add to the above list as you go._

## 5. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green,
refactor to implement the behaviour._


<!-- BEGIN GENERATED SECTION DO NOT EDIT -->

---

**How was this resource?**  
[😫](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fgolden-square&prefill_File=resources%2Fmulti_class_recipe_template.md&prefill_Sentiment=😫) [😕](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fgolden-square&prefill_File=resources%2Fmulti_class_recipe_template.md&prefill_Sentiment=😕) [😐](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fgolden-square&prefill_File=resources%2Fmulti_class_recipe_template.md&prefill_Sentiment=😐) [🙂](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fgolden-square&prefill_File=resources%2Fmulti_class_recipe_template.md&prefill_Sentiment=🙂) [😀](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fgolden-square&prefill_File=resources%2Fmulti_class_recipe_template.md&prefill_Sentiment=😀)  
Click an emoji to tell us.

<!-- END GENERATED SECTION DO NOT EDIT -->