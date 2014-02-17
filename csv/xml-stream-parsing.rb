require 'rexml/document'

require 'rexml/streamlistener'

include REXML

class Listener

  include StreamListener

  def tag_start(name, attributes)

    puts "Start #{name}"

  end

  def tag_end(name)

    puts "End #{name}"

  end

end

listener = Listener.new

parser = Parsers::StreamParser.new(File.new("shoppingcart.xml"), listener)

parser.parse