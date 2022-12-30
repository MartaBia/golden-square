class TodoList
  def initialize
    @list = [] 
  end

  def add(todo) 
    @list.push(todo)
  end

  def incomplete
    @list.reject {|todo| todo.done?}
  end

  def complete
    @list.select {|todo| todo.done?}
  end

  def give_up!
    @list.each {|todo| todo.mark_done!}
  end
end