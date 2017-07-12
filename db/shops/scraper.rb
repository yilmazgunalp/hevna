require 'nokogiri'
require 'open-uri'

file = Nokogiri::HTML(open('./gh.html'))

output = File.new('scraped.txt', 'a+')

file.css('.item-content' ).each do |item|

output.write  item.css('.pro_title').text + ","
output.write item.css('.price'&& '.redprice').text + ","
output.write item.css('.specialPrice').text
output.write "\n"   

end	
