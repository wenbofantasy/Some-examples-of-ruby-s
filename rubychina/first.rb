def count(word)
  nc = {}
  ('a'..'z').each_with_index {|x, index| nc[x] = index + 1 }
  count = 0
  word.split(//).each { |x| count +=  nc[x] }
  word.upcase! if count==100
  "#{word} is #{count}"
end

#def count2(word)
  #nc = {}
  #('a'..'z').each_with_index { |x, index| nc[x] = index + 1 }
  #count = word.split(//).map{ |x| nc[x] }.reduce(:+)
  #word.upcase! if count==100
  #"#{word} is #{count}"
#end

p count('hardwork')
p count('knowledge')
p count('luck')
p count('love')
p count('money')

p count('attitude')



#==》
#"hardwork is 98"
#"knowledge is 96"
#"luck is 47"
#"love is 54"
#"money is 72"
#
#"ATTITUDE is 100"
