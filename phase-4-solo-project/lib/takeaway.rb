class Takeaway
  def initialize
    @menu = {} 
    # @current_order = {} 
  end
  
  def add_menu(dish) 
    @menu[dish.name] = dish.price
  end

  def menu
    return @menu
  end

  def add_to_current_order #takes an integer as an input from the user and adds it to the current order
  end 
end