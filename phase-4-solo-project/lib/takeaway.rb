require_relative 'formatter.rb'
require_relative 'dish.rb'

class Takeaway
  def initialize(menu, formatter)
    @menu = menu
    @formatter = formatter
    @current_order = {} 
  end

  def menu
    return @menu
  end

  def current_order
    return @current_order
  end

  def run
    @formatter.print_header
    @formatter.print_menu(@menu)
    # user_input = STDIN.gets.chomp
  end

  # def process
  #   user_input = STDIN.gets.chomp
  #   if user_input != "STOP"
  #     add_to_current_order(user_input.to_i)
  #   end
  # end

  private

  def add_to_current_order(user_input)
    dish = @menu[user_input]
    if @current_order[user_input] == nil
      @current_order[user_input] = 0
    end
  end 
end

takeaway_formatter = Formatter.new
takeaway = Takeaway.new({
  1 => Dish.new("Mixed crostini and tuscan cured meat", 6),
  2 => Dish.new("Lasagne", 7),
  3 => Dish.new("Pumpkin and mushroom lasagne", 8),
  4 => Dish.new("Pumpkin risotto with gorgonzola", 8),
  5 => Dish.new("Paccheri with pecorino cheese cream and crispy pancetta", 7),
  6 => Dish.new("Tiramisu", 5),
}, takeaway_formatter)
takeaway.run

# create and initialize Formatter
# create and initialize Takeaway
# takeaway.run()

