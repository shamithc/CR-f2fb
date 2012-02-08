class HomeController < ApplicationController
  def index
    @user = User.new
    unless cookies["fbsr_#{FBK[:client_id]}"].nil?
     fb_auth = FbGraph::Auth.new(FBK[:client_id], FBK[:client_secret])
     fb_auth.from_cookie(cookies)
     @user_info=fb_auth.user.fetch
     if request.post?
       @user = User.new(params[:user])
       if @user.save   
          @user.create_user_info(:fb_id=>  @user_info.identifier,:access_token=> @user_info.access_token.access_token)
         render :text => 'Yes' and return 
       else
         render 'index' and return
       end 
     end
   else
    #render :text=>"Please connect with Facebook to login"
   end
    #render :text =>  @user_info.access_token.access_token
  end
end
