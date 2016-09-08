class Api::V1::Merchants::MerchantItemsController < ApplicationController
  respond_to :json

  def index
    merchant = Merchant.find(params[:id])

    respond_with merchant.items
  end
end
