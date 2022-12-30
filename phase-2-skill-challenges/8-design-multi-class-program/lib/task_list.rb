class TaskList
  def initialize
    @task_list = []
  end

  def add(task) 
    @task_list.push(task)
  end

  def all
    return @task_list
  end
end