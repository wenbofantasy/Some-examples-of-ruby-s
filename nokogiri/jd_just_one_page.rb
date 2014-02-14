#encoding: utf-8
require 'nokogiri'
require 'open-uri'
page = 'http://list.jd.com/670-671-672-0-0-0-0-0-0-0-1-1-1-1-1-72-4137-0.html' 
doc = Nokogiri::HTML.parse(open(page), nil, "GB18030") 

lis = doc.css("ul.list-h li")

count = 0
lis.each do |li|
  imgs = li.css("div.p-img img")
  image_url = imgs[0]["src"]
  if image_url.nil?
  image_url = imgs[0]["data-lazyload"]
  end
  print "image url: ", image_url, "\n"

  titles = li.css("div.p-name")
  extra = li.css("div.extra")
  price = li.css("div.p-price")

  print "product url:       ",  titles[0].children[0]["href"],"\n"
  print "product name:      ",  titles[0].children[0].text , "\n"
  print "product extra:     ",  extra[0].children[0].text , "\n"
  print "product evaluate:  ",  extra[0].children[1].text , "\n"
  print "product price:     ",  price[0].text, "\n"
  count += 1
  puts count
  puts
end
