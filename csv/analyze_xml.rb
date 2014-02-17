require 'rexml/document'
include REXML

file = File.new('REXML.xml')
doc = Document.new(file)
root = doc.root

puts ""
puts "Hello, #{root.attributes['id']}, Find below the bill generated for your purchase..."
puts ""

#sumtotal = 0
#puts "-----------------------------------------------------------------------"
#puts "Item\t\tQuantity\t\tPrice/unit\t\tTotal"
#puts "-----------------------------------------------------------------------"
#root.each_element('//item') { |item| 
  #code = item.attributes['code']
  #qty = item.elements["qty"].text.split(' ')
  #price = item.elements["price"].text.split(' ')
  #total = item.elements["price"].text.to_i * item.elements["qty"].text.to_i
  #puts "#{code}\t\t  #{qty}\t\t          #{price}\t\t         #{total}"
  #puts ""
  #sumtotal += total
#}
#puts "-----------------------------------------------------------------------"
#puts "\t\t\t\t\t\t     Sum total : " + sumtotal.to_s
#puts "-----------------------------------------------------------------------"
