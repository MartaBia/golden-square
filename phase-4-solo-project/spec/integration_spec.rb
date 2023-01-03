require 'takeaway'
require 'dish'
require 'formatter'

RSpec.describe "integration" do
  context "Integration between Takeaway and Formatter" do
    it "formats" do
      io = double :io
      takeaway_formatter = Formatter.new(io)
      takeaway = Takeaway.new({
        1 => Dish.new("Lasagne", 6),
        2 => Dish.new("Pumpkin and mushroom lasagne", 8)
      }, takeaway_formatter)
      takeaway.run
      expect(io).to receive(:puts).with("Welcome! please choose one option from the menu")
      expect(io).to receive(:puts).with("when you're done, just type 'STOP'")
    end
  end

  context "Integration among Takeaway, Dish and Formatter" do
    xit "formats the menu" do
      io = double :io
      takeaway = Takeaway.new({
        1 => Dish.new("Lasagne", 6),
        2 => Dish.new("Pumpkin and mushroom lasagne", 8)
      })
      expect(io).to receive(:puts).with("*** MENU ***")
      expect(io).to receive(:puts).with("1- Lasagne: 6")
      expect(io).to receive(:puts).with("2- Pumpkin and mushroom lasagne: 8")
      expect(io).to receive(:gets).and_return("STOP")

      takeaway_formatter = Formatter.new(takeaway, io)
      takeaway_formatter.menu_formatter
    end
  end

  xit "return the current order" do
    io = double :io
    takeaway = Takeaway.new({
      1 => Dish.new("Lasagne", 6),
      2 => Dish.new("Pumpkin and mushroom lasagne", 8)
    })
    expect(io).to receive(:puts).with("*** MENU ***")
    expect(io).to receive(:puts).with("1- Lasagne: 6")
    expect(io).to receive(:puts).with("2- Pumpkin and mushroom lasagne: 8")
    expect(io).to receive(:gets).and_return("2")
    expect(takeaway.current_order).to eq 2=>Dish.new("Pumpkin and mushroom lasagne", 8)
  end

  # USELESS TEST?
  # context "Integration between Takeaway and Dish" do
  #   it "returns the menu with multiple dishes" do
  #     takeaway = Takeaway.new(
  #       1 => Dish.new("Mixed crostini and tuscan cured meat", 6),
  #       2 => Dish.new("Lasagne", 7),
  #       3 => Dish.new("Pumpkin and mushroom lasagne", 8),
  #     )
  #     expect(takeaway.menu).to eq 1=>Dish.new("Mixed crostini and tuscan cured meat", 6), 
  #       2=>Dish.new("Lasagne", 7), 
  #       3=>Dish.new("Pumpkin and mushroom lasagne", 8)
  #   end
  # end
end