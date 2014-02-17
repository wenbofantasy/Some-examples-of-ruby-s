#require "net/http"
#uri = URI('http://localhost:3000/top')
#res = Net::HTTP.post_form(uri, 'q' => '10', 'max' => '50')
#puts res.body


require "net/http"
uri = URI('http://localhost:3000/top?q=10')
puts Net::HTTP.get(uri) # => String)'')
