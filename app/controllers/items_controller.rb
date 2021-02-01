class ItemsController < ApplicationController
   before_action :authenticate_user!, except: [:index, :show]
   before_action :selectitem, only: [:show, :edit, :update, :destroy]
   before_action :purchase_present, only: [:edit]
   
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
  redirect_to root_path if current_user.id != @item.user_id 
  # redirect_to root_path unless current_user.id == @item.user_id 同じ意味
 end

 def update
   if @item.update(item_params)
    redirect_to root_path
   else
    render :edit
   end
 end

 def destroy
  redirect_to root_path if current_user.id != @item.user_id
  if @item.destroy
    redirect_to root_path
  else
    redirect_to root_path
  end
 end
 
 private

 def item_params
  params.require(:item).permit(:image,:day_id,:products_name,:text,:category_id,:state_id,:delivery_fee_id,:area_id,:price).merge(user_id: current_user.id)
 end

 def selectitem
  @item = Item.find(params[:id])
 end

 def purchase_present
  redirect_to root_path @item.purchase_record.present?
 end
end