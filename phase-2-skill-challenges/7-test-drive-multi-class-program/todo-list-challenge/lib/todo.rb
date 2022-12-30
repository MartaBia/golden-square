class Todo
  def initialize(task)
    @task = task
    @completed_tasks = false
  end

  def task
    returns @task
  end

  def mark_done!
    @completed_tasks = true
  end

  def done?
    return @completed_tasks
  end
end