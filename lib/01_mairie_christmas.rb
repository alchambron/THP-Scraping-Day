require 'open-uri'
require 'nokogiri'

# -------- Link Cities --------------

url = 'http://www.annuaire-des-mairies.com/val-d-oise.html'

document = URI.open(url)
content = document.read
fullcontent = Nokogiri::HTML(content)

# -------- Get City Names ------------

def get_townhall_names(link)
  townhall_url = []
  link.css('.lientxt').each do |row|
    townhall_url.push(row.text.downcase.tr_s(' ', '-'))
  end
  townhall_url
end

# -------- Get city link ----------

def get_townhall_links(link)
  cities = get_townhall_names(link)
  cityurl = []
  #--------Getting the good link-------
  cities.each do |i|
    cityurl.push("http://www.annuaire-des-mairies.com/95/#{i}.html")
  end
  cityurl
end

# --------- Get city mail --------

def get_townhall_mails(link)
  final_names = get_townhall_names(link)
  final_url = get_townhall_links(link)
  final_mail = []

  final_url.each do |i|
    mailpage = Nokogiri::HTML(URI.open("#{i}"))
    mailpage.xpath('/html/body/div[1]/main/section[2]/div/table/tbody/tr[4]/td[2]').each do |k|
      final_mail.push(k.text)
    end
  end
  final_names.zip(final_mail).to_h
end

puts get_townhall_mails(fullcontent)
