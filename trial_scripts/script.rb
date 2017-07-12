
# require 'csv'
require  './database.rb'

# CSV.parse(File.open("custojghghgmers.csv"), { :headers => true, :converters => :numeric} ) do |row|
	# c = Customers.new
	#  row.each {|header,field|  c.send((header+'=').to_sym,field)}
	# c.save
	# end


	# CSV.foreach("items.csv", { :headers => true} ) do |row|
	# c = ItemsOrdered.new
	#  row.each {|header,field|  c.send((header+'=').to_sym,field)}

	# c.save
	# end

f = File.new("sabian.txt")
errors = File.new("errors.txt") 

f.each_line do |line|

product = GhMusic.new

begin 
product.brand = line.match(/^sabian/i).to_s.downcase.capitalize
product.size = line.match(/(\d{1,2})"/)[0]
product.special_price = line.match(/aud\s+\$(?<price>\d+)\s+(aud\s+\$(?<special>\d+)$)?/i)[:special]
product.price = line.match(/aud\s+\$(?<price>\d+)\s+(aud\s+\$(?<special>\d+)$)?/i)[:price]
product.series = line.match(/(aax|hhx|aa|hh|xsr|crescent|artisan|paragon|b8x|sbr|sr2|b8p)/i)
product.type = line.match(/(hats|\scr\s|ride|hi-hats|ride|crash|splash|china)/i)
# product.save
puts "#{product.brand} #{product.series} #{product.type} #{product.size} #{product.price} #{product.special_price}  "

rescue => e
File.open("errors.txt", "a") { |io| io.puts line }
puts e.exception(line)

end

end	
