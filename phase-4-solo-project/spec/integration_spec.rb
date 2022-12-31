require 'takeaway'
require 'dish'
require 'formatter'

RSpec.describe "integration" do
  it "formats" do
    takeaway = Takeaway.new
    takeaway_formatter = Formatter.new(takeaway)
    dish_1 = Dish.new("Mixed crostini and tuscan cured meat", 6)
    takeaway.add_menu(dish_1)
    expect(takeaway_formatter.format). to eq "here is the format"
  end
end