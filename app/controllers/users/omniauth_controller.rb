
class Users::OmniauthController < ApplicationController
    #this controller was generate under a directory so as to make it the same as the Devise setup but is not in use 
     #####call backs

     def github
        @user = User.create_from_github_data(request.env['omniauth.auth'])  # accept user data provided by the github and pass it to the create_from_provider_data
        if @user.persisted?
          sign_in_and_redirect @user
          set_flash_message(:notice, :success, kind: 'Github') if is_navigational_format? # devise method for successfull log in, when user saved in db.
        else
          flash[:error] = 'Hmmm, there was a problem with your Github sign in. Please register or try signing in later.'   
          redirect_to new_user_registration_url
        end
      end

     
def google_oauth2
    @user = User.create_from_google_data(request.env['omniauth.auth'])
    if @user.persisted?
      sign_in_and_redirect @user
      set_flash_message(:notice, :success, kind: 'Google') if is_navigational_format?
    else
      flash[:error] = 'Hmmm, there was a problem with your Google sign in. Please register or try signing in later.'
      redirect_to new_user_registration_url
    end 
  end

  # all authentication fails 
  def failure
    flash[:error] = 'Hmmm, there was a problem with your sign in. Please register or try signing in later.' 
    redirect_to new_user_registration_url
  end

end

