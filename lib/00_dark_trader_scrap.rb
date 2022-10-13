require 'open-uri'
require 'nokogiri'

page = Nokogiri::HTML(URI.open('https://coinmarketcap.com/all/views/all/'))

def names_crypto(source)
  name_crypto = []
  source.xpath('/html/body/div[1]/div[1]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/tr/td[2]/div/a[1]').each do |i|
    name_crypto.push(i.text)
  end
  return name_crypto
end

def values_crypto(source)
  value_crypto = []
  source.xpath('/html/body/div[1]/div[1]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/tr/td[5]/div/a/span').each do |i|
    value_crypto.push(i.text)
  end
  value_crypto
end

def crypto_compare(source)
  ncrypto = names_crypto(source)
  vcrypro = values_crypto(source)
  final = ncrypto.zip(vcrypro).to_h
  final
end

puts crypto_compare(page)
