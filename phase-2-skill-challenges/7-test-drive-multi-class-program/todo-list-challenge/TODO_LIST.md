# Diary and DiaryEntry Class Design Recipe

## 1. Describe the Problem

As a user 
I want a program that shows my todo list 

## 2. Design the Class Interface

_Include the initializer and public methods with all parameters and return values._

```ruby
# EXAMPLE

class TodoList
  def initialize
  end

  def add(todo) # todo is an instance of Todo
    # Returns nothing
  end

  def incomplete
    # Returns all non-done todos
  end

  def complete
    # Returns all complete todos
  end

  def give_up!
    # Marks all todos as complete
  end
end


class Todo
  def initialize(task) # task is a string
    # ...
  end

  def task
    # Returns the task as a string
  end

  def mark_done!
    # Marks the todo as done
    # Returns nothing
  end

  def done?
    # Returns true if the task is done
    # Otherwise, false
  end
end
```

## 3. Create Examples as Tests

_Make a list of examples of how the class will behave in different situations._

```ruby
# EXAMPLE

# 1
#todo_list_integretion_spec.rb
list = TodoList.new
todo_1 = Todo.new("Walk the dog")
list.add(todo_1)
expect(list.incomplete).to eq [todo_1]

# 2
#todo_list_integretion_spec.rb
list = TodoList.new
todo_1 = Todo.new("Walk the dog")
todo_2 = Todo.new("Buy milk")
list.add(todo_1)
list.add(todo_2)
expect(list.complete).to eq [todo_2]

# 3
#todo_list_integretion_spec.rb.rb

```

_Encode each example as a test. You can add to the above list as you go._

## 4. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._
