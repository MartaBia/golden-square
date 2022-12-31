require 'dish'

RSpec.describe Dish do
  it "constructs" do
    dish_1 = Dish.new("Mixed crostini and tuscan cured meat", 6)
    dish_2 = Dish.new("Lasagne", 7)
    expect(dish_1.name).to eq "Mixed crostini and tuscan cured meat"
    expect(dish_2.price).to eq 7
  end
end