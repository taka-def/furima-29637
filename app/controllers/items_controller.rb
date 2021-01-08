class ItemsController < ApplicationController
   before_action :move_to_index, except: [:index]
 def index
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

 private

 def item_params
  params.require(:item).permit(:image,:day_id,:products_name,:text,:category_id,:state_id,:delivery_fee_id,:area_id,:price).merge(user_id: current_user.id)
 end

 def move_to_index
   unless user_signed_in?
     redirect_to action: :index
   end
 end
end