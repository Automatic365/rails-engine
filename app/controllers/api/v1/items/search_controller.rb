class Api::V1::Items::SearchController < ApplicationController
  respond_to :json
  
  def index
    items = Item.where(item_params) 
    respond_with items
  end
  
  def show
    if params[:unit_price]
      price = params[:unit_price] 
      new_price = price.to_f * 100
      new_price = new_price.round(1).to_i
      @item = Item.find_by(unit_price: new_price) 
      respond_with @item
    else
      @item = Item.where(item_params).order(:id).take 
      respond_with @item
    end
  end
  
  private
    def item_params
      params.permit(:id, :name, :description, :unit_price, :merchant_id, :created_at, :updated_at)
    end
end