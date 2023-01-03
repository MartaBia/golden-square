class Formatter
  def initialize(io)
    @io = io
  end

  def print_header 
    @io.puts "Welcome! please choose one option from the menu"
    @io.puts "when you're done, just type 'STOP'"
  end

  def print_menu(menu)
    @io.puts "*** MENU ***"
    @takeaway.menu.each do |number, dish|
      @io.puts "#{number}- #{dish.name}: #{dish.price}"
    end
  end
end