require 'counter'

RSpec.describe Counter do
  it "counts the number you've added" do
    counter = Counter.new
    counter.add(9)
    result = counter.report()
    expect(result).to eq "Counted to 9 so far."
  end
end