class TaskTracker
  def initialize 
    @tasks_list = []
  end

  def add(task) 
    unless @tasks_list.include?(task)
      @tasks_list.push(task)
    end
  end

  def print_list 
    @tasks_list.empty? ? "All tasks completed" : @tasks_list.join(", ")
  end

  def complete(task)
    if @tasks_list.include?(task)
      @tasks_list.delete(task)
      return print_list
    else
      fail "Error: the task inserted is not in the list"
    end
  end
end

