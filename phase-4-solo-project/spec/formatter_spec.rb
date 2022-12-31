require 'formatter'

RSpec.describe Formatter do
  it "formats" do
    dish_1 = double :dish, name: "Mixed crostini and tuscan cured meat", price: 6
    takeaway = double :takeaway, add_menu: dish_1
    takeaway_formatter = Formatter.new(takeaway)
    takeaway.add_menu(dish_1)
    expect(takeaway_formatter.format). to eq "here is the format"
  end
end