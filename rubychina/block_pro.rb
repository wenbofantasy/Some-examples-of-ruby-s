def f1
  yield
end

def f2(&p)
    p.call
end

def f3(p)
    p.call
end

f1 { puts "f1" }
f2 { puts "f2" }
f3(proc{ puts "f3"})
f3(Proc.new{puts "f3"})
f3(lambda{puts "f3"})


#def f2(&p)
  #puts p.class
  #puts p.inspect
  #p.call
#end
#f2 {}


#def f()
  #yield 0
  #yield 1, 2
#end

#f do |a1, a2, a3|
  #puts "asdf", a1   
  #puts "qwer", a2
  #puts "aefq", a3
#end




