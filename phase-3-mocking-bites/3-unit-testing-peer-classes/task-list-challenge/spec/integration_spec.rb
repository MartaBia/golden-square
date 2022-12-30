require "task_list"
require "task"
require "task_formatter"

RSpec.describe "tasks integration" do
  it "adds tasks to a list" do
    task_list = TaskList.new
    task_1 = Task.new("Walk the dog")
    task_2 = Task.new("Walk the cat")
    task_list.add(task_1)
    task_list.add(task_2)
    expect(task_list.all).to eq [task_1, task_2]
  end

  it "marks tasks as complete" do
    task_list = TaskList.new
    task_1 = Task.new("Walk the dog")
    task_2 = Task.new("Walk the cat")
    task_list.add(task_1)
    task_list.add(task_2)
    task_1.mark_complete
    task_2.mark_complete
    expect(task_list.all_complete?).to eq true
  end

  context "when formatting" do
    it "formats completed tasks" do
      task = Task.new("Walk the dog")
      task_formatter = TaskFormatter.new(task)
      task.mark_complete
      expect(task_formatter.format).to eq "- [x] Walk the dog"
    end 

    it "formats incompleted tasks" do
      task = Task.new("Walk the dog")
      task_formatter = TaskFormatter.new(task)
      expect(task_formatter.format).to eq "- [ ] Walk the dog"
    end 

    it "format completed and incompleted tasks" do
      task_1 = Task.new("Walk the dog")
      task_2 = Task.new("Buy the bread")
      task_formatter_1 = TaskFormatter.new(task_1)
      task_formatter_2 = TaskFormatter.new(task_2)
      task_1.mark_complete
      expect(task_formatter_1.format).to eq "- [x] Walk the dog"
      expect(task_formatter_2.format).to eq "- [ ] Buy the bread"
    end 
  end
end