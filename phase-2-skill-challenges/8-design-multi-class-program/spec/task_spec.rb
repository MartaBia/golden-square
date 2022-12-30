require 'task'

RSpec.describe Task do
  it "constructs" do
    task_1 = Task.new("Walk the dog")
    task_2 = Task.new("Buy the bread")
    expect(task_1.title).to eq "Walk the dog"
    expect(task_2.title).to eq "Buy the bread"
  end
end