class FacebookController < ApplicationController
  def auth
    fb_auth = FbGraph::Auth.new(FBK[:client_id], FBK[:client_secret])
    #fb_auth.client
    fb_auth.from_cookie(cookies)
    #user = FbGraph::User.fetch(fb_auth.access_token) 
    render :text => fb_auth.user.fetch.username 
  end
end
