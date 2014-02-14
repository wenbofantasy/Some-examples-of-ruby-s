class Foso
  def bar
    "bar"
  end
end
bar = Foso.new
puts bar.bar

class Foo
  #alias old_bar bar
  def bar
    "{[< \"+ old_bar+ \" >]}"
  end
end
bar = Foo.new
#puts bar.old_bar


class Foo
  define_method(:bar) do
    "{[< \" + old_bar.bind(self).call() + \" >]}"
  end
end
b = Foo.new
puts b.bar

s="fooasdf"
puts local_variables
print global_variables
puts s.class
puts s.display
puts  s.inspect
puts  s.instance_variables
puts  s.methods
puts  s.private_methods
puts  s.protected_methods
puts  s.public_methods
puts  s.singleton_methods
puts  s.method(:size).arity
puts  s.method(:replace).arity




#ObjectSpace.each_object(Class) do |o|
  #puts o.inspect
#end
# List all the modules
 #ObjectSpace.each_object(Module) do |o|
 #puts o.inspect
 #end
 ## List all the instances of class String
 #ObjectSpace.each_object(String) do |o|
 #puts o.inspect
 #end



