class Director  
  def build_with builder  
    acc = ''  
    [:header, :body, :footer].each do |m|  
      acc += builder.__send__ m if builder.respond_to? m  
    end  
    acc  
  end  
end  

class HTMLBuilder  
  def header; '<html><title>html builder</title>' end
  def body;   '<body>html builder</body>' end 
  def footer; '</html>'end
end

class XMLBuilder  
  def header; '<?xml version="1.0" charset="utf-8">'end
  def body;   '<root>xml builder</root>'end
  def footer; '</html>'end
end
d = Director.new  
puts(d.build_with HTMLBuilder.new)  
puts(d.build_with XMLBuilder.new)  
