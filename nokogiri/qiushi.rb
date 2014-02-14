#encoding: utf-8
require 'open-uri'
require 'nokogiri'

doc = Nokogiri::HTML(open('http://www.qiushibaike.com/8hr'))
doc.css('.content[title]').each{|qiushi|  puts qiushi.inner_html}
