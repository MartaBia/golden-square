class Takeaway
  def initialize
    @menu = {} #is a hash containing all the dishes and their prices
    @current_order = {} # is a hash containing the dish the user wants  to order
  end
  
  def add_menu(dish) 
    return @menu[1] = dish
  end
  
  def menu #takes no argument and return the menu
  end

  def add_to_current_order #takes an integer as an input from the user and adds it to the current order
  end 
end