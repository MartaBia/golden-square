require 'todo.rb'
require 'todo_list.rb'

RSpec.describe "TodoList and Todo classes" do 
  it "returns the completed todos" do
    list = TodoList.new
    todo_1 = Todo.new("Walk the dog")
    todo_2 = Todo.new("Buy milk")
    list.add(todo_1)
    list.add(todo_2)
    todo_2.mark_done!
    expect(list.complete).to eq [todo_2]
  end

  it "returns the incomplete todos" do
    list = TodoList.new
    todo_1 = Todo.new("Walk the dog")
    todo_2 = Todo.new("Buy milk")
    list.add(todo_1)
    list.add(todo_2)
    todo_2.mark_done!
    expect(list.incomplete).to eq [todo_1]
  end

  it "completes all the todos" do
    list = TodoList.new
    todo_1 = Todo.new("Walk the dog")
    todo_2 = Todo.new("Buy milk")
    list.add(todo_1)
    list.add(todo_2)
    list.give_up!
    expect(list.complete).to eq [todo_1, todo_2]
  end

  it "returns all the tasks completed" do
    list = TodoList.new
    todo_1 = Todo.new("Walk the dog")
    todo_2 = Todo.new("Buy milk")
    todo_3 = Todo.new("Buy bread")
    list.add(todo_1)
    list.add(todo_2)
    list.add(todo_3)
    todo_3.mark_done!
    list.give_up!
    expect(list.complete).to eq [todo_1, todo_2, todo_3]
  end
end