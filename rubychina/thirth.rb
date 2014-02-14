arr1 = [
  {:key => 1, :b => 3}, 
  {:key => 2, :b => 4}, 
  {:key => 3, :b => 4}
]

arr2 = [
  {:key => 1, :c => 4}, 
  {:key => 2, :d => 5}
]

arr1.map! do |a|
  arr2.each do |b|
    if a[:key] == b[:key]
      a.merge!(b)
      break
    end
  end
  a
end
