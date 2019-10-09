class ApplicationController < ActionController::Base
      #any method put in APP Controller will be inherite by all other controller

  def authentication_required
    if !logged_in?
         redirect_to sign_in_path
    end
  
  end

  def logged_in?
    # session[:user_id]
    !!current_user
    # user_signed_in? #devise
  end
  
  #def current_user
#    @current_user ||= User.find(session[:user_id])   if session[user.id]
  #  return false if session[:user_id].nil?    
  # User.find(session[:user_id]) 

 # current_user  #devise 
  #end
  
   #helper_method :current_user # unless you declare a method a "helper_method" tou cannot call it in views


end




