class ItemsController < ApplicationController
    # before_action :authenticate_user!
    #create a new item
    # edit an item
    # Delete item 
    # Maybe portfolio item highlight(the stage )

    def create
        @capsule = Capsule.find(params[:capsule_id])  #this finds the parent capsule of an item
         @item = @capsule.items.build(item_params)  # build item associated to a capsule, sanatize user inputs with items-params private method 
        if @item.save
        redirect_to  capsule_path(@capsule)
        else 
            render "capsules/show"  #Render show from a controller outside of item controller
        end
    end 

    def show
         @capsule = Capsule.find(params[:capsule_id])
         @item = @capsule.items.with_attached_uploads.find(params[:id])
        #  @item = @capsule.items.find(params[:id])
    end

    # def destroy          
    #     @item =Item.find(params[:id])
    #     @item.destroy
    #     redirect_to capsule_path(@item.capsule)   #return to list after user deletes item
    # end


    def update
         @capsule = Capsule.find(params[:capsule_id])
         @item = @capsule.items.with_attached_uploads.find_by(params[:id])
        if @item.update(item_params)
            redirect_to @capsule
        else
            render 'edit'
        end
    end

    #mod on 09/26
    def edit
          @capsule = Capsule.find(params[:capsule_id])
         @item = @capsule.items.with_attached_uploads.find_by(params[:id])    
    end


  #mod 09/26
    def destroy
        @capsule = Capsule.find(params[:capsule_id])
        @item = @capsule.items.find(params[:id])
        @item.destroy
        redirect_to capsule_path(@capsule)
    end




    private

    def item_params
        params.require(:item).permit(:name,:description, uploads: [] )  # later permit name and file user params, 
    end

end
