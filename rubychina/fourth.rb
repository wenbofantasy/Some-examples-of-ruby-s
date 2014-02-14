#encoding: utf-8
require "watir-webdriver"

def ruby_china_nodes_info
  @browser = Watir::Browser.new
  (1..49).inject([]) { |total,i| total << fetch_node_info(i)}
  .sort_by{|_,topics| -topics }
  .slice(0...30)
  .tap { @browser.close } 
end

def fetch_node_info(node_index)
  @browser.goto "http://ruby-china.org/topics/node#{node_index}"
  div = @browser.div(:id => 'node_info')
  [
    div.h2.text,
    div.span(:class =>'total').text =~/(\d+)/ ? ($1.to_i):0 
  ]
rescue
  ["Unkown node#{node_index}",0]   
end


if __FILE__ == $0

  # for win32 console
  STDOUT.set_encoding "gbk"

  nodes_info = ruby_china_nodes_info  
  nodes_info.each {|node,topics|  puts "#{node}:#{topics}" }

end
