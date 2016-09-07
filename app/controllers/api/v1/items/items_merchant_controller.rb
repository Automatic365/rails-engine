class Api::V1::Items::ItemsMerchantController < ApplicationController
  respond_to :json

  def index
    item = Item.find(params[:id])

    respond_with item.merchant
  end


end
