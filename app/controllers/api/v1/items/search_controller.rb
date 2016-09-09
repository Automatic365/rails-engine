class Api::V1::Items::SearchController < ApplicationController
  respond_to :json
  
  def index
    items = Item.where(item_params) 
    respond_with items
  end
  
  def show
    if params[:unit_price]
      # require "pry"; binding.pry
      price = params[:unit_price] 
      new_price = price.to_f * 100
      params[:new_price] = new_price
      params[:unit_price] = params[:new_price]
      number_with_precision
      item = Item.find_by(params[:unit_price]) 
      respond_with item
    else
      item = Item.find_by(item_params) 
      respond_with item
    end
  end
  
  private
    def item_params
      params.permit(:id, :name, :description, :unit_price, :merchant_id, :created_at, :updated_at)
    end
end