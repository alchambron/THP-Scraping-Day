require_relative('../lib/00_dark_trader_scrap.rb')

page = Nokogiri::HTML(URI.open('https://coinmarketcap.com/all/views/all/'))

describe 'Testing scraping with Crypto Names' do
  it 'Should return not nil if name-crypto is returned' do
    expect(names_crypto(page)).to_not be_nil
  end
end

describe 'Testing scraping with Crypto Values' do
  it 'Should return not nil if values-crypto is returned' do
    expect(values_crypto(page)).to_not be_nil
  end
end

describe 'Testing final result' do
  it 'Should return not nil if Crypto_compare is working' do
    expect(crypto_compare(page)).to_not be_nil
  end
end
