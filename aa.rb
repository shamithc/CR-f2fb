require 'rubygems'
require 'time'
#require 'date'


require 'flickraw'

#FlickRaw.api_key="... Your API key ..."
#FlickRaw.shared_secret="... Your shared secret ..."

FlickRaw.api_key= "8a130b53b399167995390dbf57dbc29e"
FlickRaw.shared_secret= "131ba509c49cceed"


token = flickr.get_request_token
auth_url = flickr.get_authorize_url(token['oauth_token'], :perms => 'delete')

puts "Open this url in your process to complete the authication process : #{auth_url}"
puts "Copy here the number given when you complete the process."
verify = gets.strip

begin
  flickr.get_access_token(token['oauth_token'], token['oauth_token_secret'], verify)
  login = flickr.test.login
  puts "You are now authenticated as #{login.username} with token #{flickr.access_token} and secret #{flickr.access_secret}"
rescue FlickRaw::FailedResponse => e
  puts "Authentication failed : #{e.msg}"
end



