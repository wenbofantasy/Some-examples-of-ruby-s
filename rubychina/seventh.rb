class SampleService
  def m1(data)
    return "You sent me '#{data}'"
  end
  def m2(data)
    return "You sent me 2'#{data}'"
  end
end

class Wrapping
  def initialize(target)
    @target = target
  end

  def method_missing(m, *args)
    return "Wrapped:#{@target.send(m, *args)}:Wrapped"
  end
end

wrap = Wrapping.new(SampleService.new)
p wrap.m1("something")
p wrap.m2("something")
