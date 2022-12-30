require 'present'

RSpec.describe Present do

  it "when wraps and unwraps" do
    gift = Present.new
    gift.wrap("scarf")
    expect(gift.unwrap).to eq "scarf"
  end

  context "when unwraps" do
    it "fails" do
      gift = Present.new
      expect { gift.unwrap }.to raise_error "No contents have been wrapped."
    end
  end

  context "when wraps" do
    it "fails" do
      gift = Present.new
      gift.wrap("toy")
      expect { gift.wrap("scarf") }.to raise_error "A contents has already been wrapped."
    end
  end

end