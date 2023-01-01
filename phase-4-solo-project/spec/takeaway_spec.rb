require 'takeaway'

RSpec.describe Takeaway do
  it "returns the menu with only one entry" do
    takeaway = Takeaway.new
    dish_1 = double :dish, name: "Lasagne", price: 6
    takeaway.add_menu(dish_1)
    expect(takeaway.menu).to eq "Lasagne"=>6
  end

  it "returns the menu with multiple dishes" do
    takeaway = Takeaway.new
    dish_1 = double :dish, name: "Mixed crostini and tuscan cured meat", price: 6
    dish_2 = double :dish, name: "Lasagne", price: 7
    dish_3 = double :dish, name: "Pumpkin and mushroom lasagne", price: 8
    takeaway.add_menu(dish_1)
    takeaway.add_menu(dish_2)
    takeaway.add_menu(dish_3)
    expect(takeaway.menu).to eq "Mixed crostini and tuscan cured meat"=>6, 
      "Lasagne"=>7, 
      "Pumpkin and mushroom lasagne"=>8
  end
end