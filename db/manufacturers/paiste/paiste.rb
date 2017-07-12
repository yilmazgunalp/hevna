f = File.open("paiste.txt")
paiste = File.open("paiste.csv","a+")

#multi-line match
f.read.scan(/\n\n?((.*|\n)*)\n\n/).each do |m|
	codes =  m[0].match(/(?<=^SKU:[\r\n])([^\r\n]+)/)
	model =  m[0].match(/(.*)(?=[\r\n]+^((\d+"\s?)+))/)
	sizes = m[0].match(/^((\d+"\s)+)/)
	desc = m[0].match(/(?<=Sound Character:\n)((.*|\n)*)\n(?=Sound Files)/)

	for i in (0..codes[0].split(",").length-1) 
		paiste.puts("#{codes[0].split(",")[i].strip};#{ARGV[0]};#{model};;#{sizes[0].split(" ")[i][0..-2]};#{desc}")
		i += 1

	end	
end	