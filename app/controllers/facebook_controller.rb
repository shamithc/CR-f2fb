class FacebookController < ApplicationController
  def auth
    FlickRaw.api_key=  "d034e7a467967b7624b037b8a73050c4"#  "8a130b53b399167995390dbf57dbc29e"
    FlickRaw.shared_secret= "879cbcfe38123374" #"131ba509c49cceed"
    #frob = flickr.auth.getFrob
    #flickr.auth.oauth.getAccessToken
    token = flickr.get_request_token
    auth_url = flickr.get_authorize_url(token['oauth_token'], :perms => 'delete')
    #frob = flickr.auth.getFrob
    redirect_to auth_url and return

  end

end
