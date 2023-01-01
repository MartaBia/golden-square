class Formatter
  def initialize(takeaway, io)
    @takeaway = takeaway
    @io = io
  end

  def print_footer 
    @io.puts "Welcome! please choose one option from the menu"
    @io.puts "when you're done, just type 'STOP'"
  end

  def print_menu
    @io.puts "*** MENU ***"
    
  end
end