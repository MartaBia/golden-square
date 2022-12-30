require 'report_length'

RSpec.describe "reports the length of a string" do
  it "repots the lenght for the string 'computer'" do
    result = report_length("computer")
    expect(result).to eq "This string was 8 characters long."
  end
end