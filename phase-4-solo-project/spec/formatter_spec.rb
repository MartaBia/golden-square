require 'formatter'

RSpec.describe Formatter do
  it "formats the footer" do
    io = double :io
    dish_1 = double :dish, name: "Mixed crostini and tuscan cured meat", price: 6
    takeaway = double :takeaway
    expect(io).to receive(:puts).with("Welcome! please choose one option from the menu")
    expect(io).to receive(:puts).with("when you're done, just type 'STOP'") 

    takeaway_formatter = Formatter.new(takeaway, io)
    takeaway_formatter.print_footer
  end

  #TODO: test print the menu
end