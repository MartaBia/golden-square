require "task_formatter"

RSpec.describe TaskFormatter do
  it "formats completed tasks" do
    task = double :task, title: "Walk the dog", complete?: true
    task_formatter = TaskFormatter.new(task)
    expect(task_formatter.format).to eq "- [x] Walk the dog"
  end 

  it "formats incompleted tasks" do
    task = double :task, title: "Walk the dog", complete?: false
    task_formatter = TaskFormatter.new(task)
    expect(task_formatter.format).to eq "- [ ] Walk the dog"
  end 

  it "format completed and incompleted tasks" do
    task_1 = double :task, title: "Walk the dog", complete?: true
    task_2 = double :task, title: "Buy the bread", complete?: false
    task_formatter_1 = TaskFormatter.new(task_1)
    task_formatter_2 = TaskFormatter.new(task_2)
    expect(task_formatter_1.format).to eq "- [x] Walk the dog"
    expect(task_formatter_2.format).to eq "- [ ] Buy the bread"
  end 
end 