require 'csv'
require  './lib/database'
 
#OPEN THE FILE PASSED FROM COMMANLINE

f = File.open("./data_files/#{ARGV[0]}") 
n = File.basename(f,'.*')

#CREATE A TABLE IN DATABASE BY FILENAME

sql = "create table #{n} (brand VARCHAR(50) NOT NULL, product_id VARCHAR(50), series VARCHAR(50) NOT NULL, 
size INT(3) NOT NULL, type VARCHAR(50) NOT NULL, price DOUBLE NOT NULL, special_price DOUBLE, model VARCHAR(50))"
ActiveRecord::Base.connection.execute(sql)

#CREATE A RUBY CLASS FILE BY FILENAME INHERTING FROM ACTIVE RECORD

File.open("./lib/#{n}.rb", "a+") do |f|
f.puts "class #{n.capitalize} < ActiveRecord::Base \n 
self.table_name = '#{n}'
end"
end

#LOAD THE CREATED CLASS FILE

load  "./lib/#{n}.rb"

# READ THE FILE PASSED FROM COMMANDLINE AND SAVE DATA INTO DATABASE

CSV.foreach(f, headers: true) do |row|

product = n.classify.constantize.new
row.each {|header,field|  product.send((header+'=').to_sym,field)}
product.save

end	

 