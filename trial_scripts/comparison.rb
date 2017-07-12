require 'csv'
require  './database.rb'


File.open("file.csv", "w")
f = File.new("sabian.txt")
File.open("errors.txt", "w") 

f.each_line do |line|

product = GhMusic.new
pr_array = []
begin 
pr_array << product.brand = line.match(/\w+\s/i).to_s.downcase.capitalize
pr_array << product.series = line.match(/(aax|hhx|aa|hh|xsr|crescent|artisan|paragon|b8x|sbr|sr2|b8p)/i)
pr_array << product.size = line.match(/(?<sizey>\d{1,2})"/)[:sizey]
pr_array << product.type = line.match(/(hats|\scr\s|ride|hi-hats|ride|crash|effect|chinese|chin|flat-ride|stax|omni|splash|china)/i)

pr_array << product.price = line.match(/aud\s+\$(?<price>\d+)\s+(aud\s+\$(?<special>\d+)$)?/i)[:price]
pr_array << product.special_price = line.match(/aud\s+\$(?<price>\d+)\s+(aud\s+\$(?<special>\d+)$)?/i)[:special]


rescue => e
File.open("errors.txt", "a") { |io| io.puts line }
puts e.message
else

CSV.open("file.csv", "a") do |csv|
csv << pr_array

end

end

end	


# CSV.parse(File.open("file.csv"), { :headers => true, :converters => :numeric} ) do |row|
# 	c = GhMusic.new
# 	 row.each {|header,field|  c.send((header+'=').to_sym,field)}
# 	c.save
# 	end


	# CSV.foreach("items.csv", { :headers => true} ) do |row|
	# c = ItemsOrdered.new
	#  row.each {|header,field|  c.send((header+'=').to_sym,field)}

	# c.save
	# end