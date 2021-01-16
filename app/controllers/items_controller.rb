class ItemsController < ApplicationController
   before_action :authenticate_user!, except: [:index, :show]
   before_action :selectitem, only: [:show, :edit, :update]
   
 def index
   @items = Item.all.order(id: "DESC")
 end

 def new
  @item = Item.new
 end

 def create
  @item = Item.new(item_params)
  if @item.save
     redirect_to root_path
  else
     render :new
  end
 end
    
 def show
 end
 
 def edit
 end

 def update
   if @item.update(item_params)
    redirect_to root_path
   else
    render :edit
   end
 end
 
 private

 def item_params
  params.require(:item).permit(:image,:day_id,:products_name,:text,:category_id,:state_id,:delivery_fee_id,:area_id,:price).merge(user_id: current_user.id)
 end

 def selectitem
  @item = Item.find(params[:id])
 end


end