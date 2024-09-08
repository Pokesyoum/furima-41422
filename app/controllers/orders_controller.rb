class OrdersController < ApplicationController
  def index
    gon.public_key = ENV['PAYJP_PUBLIC_KEY']
    @order_address_form = OrderAddressForm.new
    @item = Item.find(params[:item_id])
  end

  def create
    @order_address_form = OrderAddressForm.new(order_address_params)
    @item = Item.find(params[:item_id])
    if @order_address_form.valid?
      pay_item
      @order_address_form.save
      redirect_to root_path
    else
      gon.public_key = ENV['PAYJP_PUBLIC_KEY']
      render :index, status: :unprocessable_entity
    end
  end

  private

  def order_address_params
    params.require(:order_address_form).permit(:area_id, :postal_code, :city, :street, :building, :phone_number).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price, # 商品の値段
      card: order_address_params[:token], # カードトークン
      currency: 'jpy' # 通貨の種類（日本円）
    )
  end
end
