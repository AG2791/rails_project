class UsersController < ApplicationController
    protect_from_forgery #with: :null_session   # read about CSRF tokens
    #   before_action :authenticate_user!

  
    
      def new
        @user = User.new 
      end


    def create
      @user = User.new
      @user.email = params[:user][:email]
      @user.password = params[:user][:password]
     if  @user.save 
        session[:user_id] = @user.id
        redirect_to '/sign_in'   
     else
        render "/sign_up"
    end
  end


  # User profile 
    # def show
    #     @user = User.find(params[:id])  # why didn't :id or User_id work 
    #     @capsules = current_user.capsules
    # end




    private

    def user_params
        params.require(:user).permit(:email,:avatar)   
    end
end
