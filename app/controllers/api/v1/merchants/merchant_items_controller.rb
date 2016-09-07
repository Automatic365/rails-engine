class Api::V1::Merchants::MerchantItemsController < ApplicationController
  respond_to :json

  def show
    merchant = Merchant.find(params[:id])

    respond_with merchant.items
  end

end
