# TaskTracker Class Design Recipe

## 1. Describe the Problem

As a user
So that I can keep track of my tasks
I want a program that I can add todo tasks to and see a list of them.

As a user
So that I can focus on tasks to complete
I want to mark tasks as complete and have them disappear from the list.

## 2. Design the Class Interface


```ruby
# EXAMPLE

class TaskTracker
  def initialize # name is a string
    # ...
  end

  def add(task) # task is a string
    # No return value
  end

  def tasks_list 
    #return a list of tasks as string
  end

  def complete(task)
    # Returns a lisk of the tasks that need to be completed
  end
end
```

## 3. Create Examples as Tests

_Make a list of examples of how the class will behave in different situations._

```ruby
# EXAMPLE

# 1
task_tracker = TaskTracker.new
task_tracker.add("Walk the dog")
task_tracker.task_list # => "Walk the dog"

# 2
task_tracker = TaskTracker.new
task_tracker.add("Walk the dog")
task_tracker.add("Buy bread")
task_tracker.task_list() # => "- Walk the dog - Buy bread"

#3
task_tracker = TaskTracker.new
task_tracker.add("Walk the dog")
task_tracker.add("Walk the dog")
task_tracker.task_list() # => "- Walk the dog"

#4
task_tracker = TaskTracker.new
task_tracker.add("Walk the dog")
task_tracker.add("Buy bread")
task_tracker.complete("Buy bread") # => "- Walk the dog"

#5
task_tracker = TaskTracker.new
task_tracker.add("Buy bread")
task_tracker.complete("Buy bread") # => "All tasks completed"

#6
task_tracker = TaskTracker.new
task_tracker.add("Buy bread")
task_tracker.complete("Walk the dog") # => "Error: the task inserted is not in the list"
```

_Encode each example as a test. You can add to the above list as you go._

## 4. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._