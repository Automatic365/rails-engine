class Api::V1::Items::SearchController < ApplicationController
  respond_to :json
  
  def index
    items = Item.where(request.query_parameters)
    respond_with items
  end
  
  def show
    item = Item.find_by(request.query_parameters)
    respond_with item
  end
  
  private
    def item_params
      params.require(:item).permit(:id, :name, :description, :unit_price, :merchant_id, :created_at, :updated_at)
    end
end