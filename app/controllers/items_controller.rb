class ItemsController < ApplicationController
  before_action :authenticate_user!, only: :new
  def index
  end

  def new
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :description, :category_id, :status_id, :fee_id, :area_id, :day_id, :price,
                                 :image).merge(user_id: current_user.id)
  end
end
