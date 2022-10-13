require 'open-uri'
require 'nokogiri'

url = 'https://www2.assemblee-nationale.fr/deputes/liste/alphabetique'

document = URI.open(url)
content = document.read
fullcontent = Nokogiri::HTML(content)



