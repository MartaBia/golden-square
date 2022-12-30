require 'task_tracker'

RSpec.describe TaskTracker do
  context "#add & #print_list" do
    it "add a task on the tasks list" do
      task_tracker = TaskTracker.new
      task_tracker.add("Walk the dog")
      expect(task_tracker.print_list).to eq "Walk the dog"
    end

    it "add a task after another" do
      task_tracker = TaskTracker.new
      task_tracker.add("Walk the dog")
      task_tracker.add("Buy bread")
      expect(task_tracker.print_list).to eq "Walk the dog, Buy bread"
    end

    it "does not repeat the same task twice" do
      task_tracker = TaskTracker.new
      task_tracker.add("Walk the dog")
      task_tracker.add("Walk the dog")
      expect(task_tracker.print_list).to eq "Walk the dog"
    end
  end

  context "#complete" do
    it "completes one task" do
      task_tracker = TaskTracker.new
      task_tracker.add("Walk the dog")
      task_tracker.add("Buy bread")
      expect(task_tracker.complete("Buy bread")).to eq "Walk the dog"
    end

    it "returns All tasks completed when no task is present" do
      task_tracker = TaskTracker.new
      task_tracker.add("Buy bread")
      expect(task_tracker.complete("Buy bread")).to eq "All tasks completed"
    end

    it "raise an error when the task is not in the list" do
      task_tracker = TaskTracker.new
      task_tracker.add("Buy bread")
      expect { task_tracker.complete("Walk the dog") }.to raise_error "Error: the task inserted is not in the list"
    end    
  end
end