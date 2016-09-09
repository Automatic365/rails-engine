class Api::V1::Merchants::MerchantItemsController < ApplicationController
  respond_to :json

  def index
    merchant = Merchant.find(params[:id])

    respond_with merchant.items
  end

  def show
    merchant = Merchant.most_items(params[:quantity])

    respond_with merchant
  end
end
