require 'takeaway'
require 'dish'
require 'formatter'

RSpec.describe "integration" do
  context "Integration between Takeaway and Formatter" do
    it "formats the footer" do
      io = double :io
      takeaway = Takeaway.new
      expect(io).to receive(:puts).with("Welcome! please choose one option from the menu")
      expect(io).to receive(:puts).with("when you're done, just type 'STOP'")
    
      takeaway_formatter = Formatter.new(takeaway, io)
      takeaway_formatter.print_footer
    end
  end

  context "Integration between Takeaway and Dish" do
    it "returns the menu with only one entry" do
      takeaway = Takeaway.new
      dish_1 = Dish.new("Lasagne", 6)
      takeaway.add_menu(dish_1)
      expect(takeaway.menu).to eq "Lasagne"=>6
    end

    it "returns the menu with multiple dishes" do
      takeaway = Takeaway.new
      dish_1 = Dish.new("Mixed crostini and tuscan cured meat", 6)
      dish_2 = Dish.new("Lasagne", 7)
      dish_3 = Dish.new("Pumpkin and mushroom lasagne", 8)
      takeaway.add_menu(dish_1)
      takeaway.add_menu(dish_2)
      takeaway.add_menu(dish_3)
      expect(takeaway.menu).to eq "Mixed crostini and tuscan cured meat"=>6, 
        "Lasagne"=>7, 
        "Pumpkin and mushroom lasagne"=>8
    end
  end
end