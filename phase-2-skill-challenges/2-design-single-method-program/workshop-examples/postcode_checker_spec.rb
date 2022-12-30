require_relative '../lib/postcode_checker'

describe 'postcode_checker' do
  it 'fails for a non-postcode string' do
    result = postcode_checker('ABCDEFG')
    expect(result).to eq(false)
  end

  it 'succeeds for a AA9A 9AA string' do
    result = postcode_checker('SW1A 7YT')
    expect(result).to eq(true)
  end

  it 'fails for a AAA AAA string' do
    result = postcode_checker('ABC DEFG')
    expect(result).to eq(false)
  end

  it 'succeeds for a A9A 9AA string' do
    result = postcode_checker('A9A 9AA')
    expect(result).to eq(true)
  end

  it 'succeeds for a A9 9AA string' do
    result = postcode_checker('A9 9AA')
    expect(result).to eq(true)
  end
end
