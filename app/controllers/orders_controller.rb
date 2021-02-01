class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :select_order, only: [:index, :create]

  def index
    @order = Order.new
    redirect_to root_path if current_user == @item.user &&  @item.purchase_record.present
    # フォームオブジェクトなのでアクティブレコードは使えない
  end

  def create
    @order = Order.new(orders_params)
    # フォームオブジェクトなのでアクティブレコードは使えない
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
     else
      render :index
    end
  end

  private
  def orders_params
    params.require(:order).permit(:zip_code, :area_id, :city, :street_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def select_order
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price, 
        card: @order.token,   
        currency: 'jpy'                 
      )
  end
end