#!/usr/bin/env ruby
require 'net/http'

unless uri = (URI.parse(ARGV.shift) rescue nil)
puts "Usage: #$0 <url>"
exit
end

puts "Sending PUT #{uri.request_uri} to #{uri.host}:#{uri.port}"
Net::HTTP.start(uri.host, uri.port) do |http|
headers = {'Content-Type' => 'text/plain; charset=utf-8'}
put_data = "put payload"
response = http.send_request('PUT', uri.request_uri, put_data,
headers)
puts "Response #{response.code} #{response.message}:
#{response.body}"
end

