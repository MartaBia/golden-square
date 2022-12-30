require 'check_codeword'
RSpec.describe "check_codewood method" do
  it "tests codeword" do
    result = check_codeword("horse")
    expect(result).to eq "Correct! Come in."
  end
  
  it "tests codeword2" do
     result = check_codeword("house")
     expect(result).to eq "Close, but nope."
  end
  
  it "tests codeword3" do
     result = check_codeword("pineapple") 
     expect(result).to eq "WRONG!"
  end
end