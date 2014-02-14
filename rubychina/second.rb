n=120
primes = Array.new
for i in 0..n-2
  primes[i] = i+2
end   

index = 0 
while primes[index]**2 <= primes.last
  prime = primes[index]
  primes = primes.select { |x| x == prime || x % prime != 0 }
  index += 1
end
p primes  #result: [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97, 101, 103, 107, 109, 113]



 #素数判定不用自己实现啦
 #require 'mathn'
 #p Prime.take_while{|n| n<120}
