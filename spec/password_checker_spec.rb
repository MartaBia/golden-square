require 'password_checker'

RSpec.describe PasswordChecker do

  it "when password >= 8 return true" do
    word = PasswordChecker.new
    expect(word.check("hellooooooo")).to eq true
  end

  it "password < 8 characters" do
    word = PasswordChecker.new
    expect { word.check("hi") }.to raise_error "Invalid password, must be 8+ characters."
  end
end