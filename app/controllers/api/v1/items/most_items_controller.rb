class Api::V1::Items::MostItemsController < ApplicationController
  respond_to :json

  def index
    items = Item.most_items(params[:quantity])

    respond_with items
  end

end
