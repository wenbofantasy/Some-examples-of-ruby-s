#require 'csv'

#people=CSV.parse(File.read('jd.txt'))
#puts people



require 'csv'

writer = CSV.open('mycsvfile.csv','w')

begin
  print "Enter Contact Name: "
  name = STDIN.gets.chomp
  print "Enter Contact No: "
  num = STDIN.gets.chomp
  s = name+" "+num
  row1 = s.split
  writer << row1
  print "Do you want to add more ? (y/n): "
  ans = STDIN.gets.chomp
end 
#end while ans != "n"
writer.close

puts CSV.parse(File.read('mycsvfile.csv'))
