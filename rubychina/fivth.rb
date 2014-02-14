# create a struct with :value and :next
Cell = Struct.new(:value, :next)

# create a head of our list
list = Cell.new("head. hi", nil)

# array
a = []

# method which create one more cell and return the struct
def linked_list(value, cell)
  return Cell.new(value, cell)
end

# simple benchmark timer. t1 - t2 = waiting time ;)
def bench type
  t1 = Time.now


  yield
  t2 = Time.now
  p "#{type}'s took #{t2 - t1}s"
end


bench ("array") {
  100000.times { a.insert 0,10} # O(n)
}

bench ("linked list") {
  100000.times { list = linked_list(10, list) } # O(1)
}
