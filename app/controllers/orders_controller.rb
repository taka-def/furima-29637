class OrdersController < ApplicationController

  before_action :selectorder, only: [:index, :create]

  def index
    @order = Order.new
    # フォームオブジェクトなのでアクティブレコードは使えない
  end

  def create
    @order = Order.new(orders_params)
    # フォームオブジェクトなのでアクティブレコードは使えない
    if @order.valid?
      @order.save
      redirect_to root_path
     else
      render :index
    end



  end

  private
  def orders_params
    params.require(:order).permit(:zip_code, :area_id, :city, :street_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def selectorder
    @item = Item.find(params[:item_id])
  end


end
