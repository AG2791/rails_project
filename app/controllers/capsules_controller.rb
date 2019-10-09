class CapsulesController < ApplicationController
      before_action :authenticate_user!
    #   before_action :capsule_params, only: [:show]   #public access limitations 
    #  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
    layout "capsules"
    #List all items in capsule  
    def index
         @capsule = Capsule.new   #maybe make this it's own method 
         @capsules = Capsule.all 
        #@capsules = user.capsules
    end
    
    #new capsule    #mod 09/26
    # def new rail
    #     @capsule = Capsule.new
    # end


    # def create  
    #     #creates new capsule
    #         @capsule = Capsule.new(capsule_params)  #use private method(capsule_params) to sanatize  input and allow them to be mass assigned #mod on 9/24 to current_user
    #     # @capsule = current_user.capsules.new(capsule_params) 

    #     # @user = User.find[:user_id] # this finds users
    #     # @capsule = @user.Capsule.new(capsule_params)

    #     if  @capsule.save
    #     redirect_to capsule_path(@capsule)   # maybe use a capsule_url function instead of capsule capsule_path
    #     else
    #     @capsule = Capsule.all   #maybe comment this out 
    #     render :index
    #     end
    # end


    def create  
        #creates new capsule
        @capsule = Capsule.new(capsule_params)  #use private method(capsule_params) to sanatize  input and allow them to be mass assigned
        @capsule.user = current_user # mod 10/01
        # @capsule.name = params[:capsule][:name]  #is this necessary given that params already provides this in the private method?
       if  @capsule.save
        redirect_to capsule_path(@capsule)   # maybe use a capsule_url function instead of capsule capsule_path
       else
        @capsule = Capsule.all  
        render :index
       end
    end


    def show
            #show a capsule via primary key, use params 
            # params contains the data passed by the user as a hash 
        @capsule = Capsule.find(params[:id])
                                #/capsule/:id

        @item = @capsule.items.build                          
    end


    #mod 09/26
    def update
        @capsule = Capsule.find(params[:id])
        if @capsule.update(capsule_params)
            redirect_to @capsule
        else
            render 'edit'
        end
    end

    #mod 09/26
    def edit
        @capsule = Capsule.find(params[:id])
    end

    #mod 09/26
    def destroy
        @capsule = Capsule.find(params[:id])
        @capsule.destroy

        redirect_to capsules_path  #maybe capsule_path
    end


        
     
    
    
     private 
     # read about mass assignments 
     def capsule_params  #strong params
        params.require(:capsule).permit(:name) # param requires a key of capsule and within that key permit a key of name 
                                  #permit a key of name
     end
end
