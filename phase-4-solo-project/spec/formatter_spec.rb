require 'formatter'

RSpec.describe Formatter do
  it "formats the header" do
    io = double :io
    dish_1 = double :dish, name: "Mixed crostini and tuscan cured meat", price: 6
    takeaway = double :takeaway
    expect(io).to receive(:puts).with("Welcome! please choose one option from the menu")
    expect(io).to receive(:puts).with("when you're done, just type 'STOP'") 

    takeaway_formatter = Formatter.new(takeaway, io)
    takeaway_formatter.print_header
  end

  xit "formats the menu" do
    io = double :io
    takeaway = double :takeaway, initialize:({
      1 => (double :dish, name: "Lasagne", price: 6),
      2 => (double :dish, name: "Pumpkin and mushroom lasagne", price: 8),
    })
    expect(io).to receive(:puts).with("*** MENU ***")
    expect(io).to receive(:puts).with("1- Lasagne: 6")
    expect(io).to receive(:puts).with("2- Pumpkin and mushroom lasagne: 8")
    expect(io).to receive(:gets).and_return("STOP")

    takeaway_formatter = Formatter.new(takeaway, io)
    takeaway_formatter.menu_formatter
  end
end