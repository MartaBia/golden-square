require 'count_words'

describe 'count_words method' do 
  it 'return number of words in a given string' do 
    result = count_words('This is a test string')
    expect(result).to eq 5
  end
end
